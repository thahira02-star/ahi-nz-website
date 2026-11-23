# -*- coding: utf-8 -*-
with open("final output/preventative-maintenance.html", "r", encoding="utf-8") as f:
    c = f.read()

# Replace mojibake
c = c.replace("AHI Carrier \u00e2\u20ac\u201d A Carrier Joint Venture Company", "AHI Carrier &mdash; A Carrier Joint Venture Company")
c = c.replace("AHI Carrier â€” A Carrier Joint Venture Company", "AHI Carrier &mdash; A Carrier Joint Venture Company")

# Update responsive rule
old_rule = ".split-banner-card { grid-template-columns: 1fr; }"
new_rule = """.split-banner-card { grid-template-columns: 1fr; height: auto; min-height: auto; }
      .split-banner-media { height: 320px; min-height: 320px; }
      .split-banner-content { height: auto; min-height: auto; padding: 40px 32px; }"""

if old_rule in c:
    c = c.replace(old_rule, new_rule)

with open("final output/preventative-maintenance.html", "w", encoding="utf-8") as f:
    f.write(c)

print("Python script completed.")
