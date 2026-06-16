---
layout: default
title: Projects
---

{% for project in site.projects %}
<p>
  <strong>{{ project.title }}</strong> ({{ project.year }})
</p>
{{ project.content }}
{% endfor %}