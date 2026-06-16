---
layout: default
title: Projects
---

{% for project in site.projects %}
<p>
  <strong><a href="{{ project.link }}">{{ project.title }}</a></strong> ({{ project.year }})
</p>
{{ project.content }}
{% endfor %}