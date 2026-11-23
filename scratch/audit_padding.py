# Audit section paddings in chiller-maintenance.html and preventative-maintenance.html
import re

files = [
    'final output/chiller-maintenance.html',
    'final output/preventative-maintenance.html'
]

for fpath in files:
    print(f"=== {fpath} ===")
    with open(fpath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all <section ... class="..."
    sections = re.findall(r'<section[^>]*class=["\']([^"\']+)["\']', content)
    unique_classes = set()
    for s in sections:
        for c in s.split():
            unique_classes.add(c)
    
    print("Classes used on sections:", unique_classes)
    for c in sorted(unique_classes):
        pattern = rf'\.{re.escape(c)}\s*\{{([^}}]+)\}}'
        matches = re.findall(pattern, content)
        for m in matches:
            # Look for padding
            paddings = [line.strip() for line in m.split(';') if 'padding' in line]
            if paddings:
                print(f"  .{c} -> {'; '.join(paddings)}")
            else:
                print(f"  .{c} -> (no padding defined in main block)")

