---
layout: default
title: Projects
---

{% for project in site.projects %}
<p>
  <strong>{{ project.title }}</strong> ({{ project.year }})<br>
  {{ project.content | strip_html }}
</p>
{% endfor %}