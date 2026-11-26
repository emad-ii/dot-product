#!/usr/bin/env python3
"""Check that the paper, its source and the Lean proof match release.json, and that the
copies the website offers for download are the same files.

    python3 scripts/verify.py            check
    python3 scripts/verify.py --write    record the current files in release.json
"""
import hashlib, json, pathlib, sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
FILES = [
    "paper/A_Dot_Product_Is_All_You_Need_Final.pdf",
    "paper/A_Dot_Product_Is_All_You_Need_Final.tex",
    "lean/A_Dot_Product_Is_All_You_Need_Final.lean",
]

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    manifest = ROOT / "release.json"
    current = {f: sha(ROOT / f) for f in FILES}
    if "--write" in sys.argv:
        data = json.loads(manifest.read_text()) if manifest.exists() else {}
        data["files"] = current
        manifest.write_text(json.dumps(data, indent=2) + "\n")
        print("release.json updated")
        return 0
    recorded = json.loads(manifest.read_text())["files"]
    bad = [f for f in FILES if recorded.get(f) != current[f]]
    for f in FILES:
        copy = ROOT / "docs" / "files" / pathlib.Path(f).name
        if not copy.exists() or sha(copy) != current[f]:
            bad.append(f"docs/files/{copy.name} (stale copy; run npm run build)")
    for b in bad:
        print("mismatch:", b)
    if not bad:
        print("all files match release.json")
    return 1 if bad else 0

sys.exit(main())
