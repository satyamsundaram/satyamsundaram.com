---
layout: default
title: Projects
---

{% assign projects = site.projects | sort: 'year' | reverse %}
{% for project in projects %}
<p>
  <strong><a href="{{ project.url }}">{{ project.title }}</a></strong> ({{ project.year }})
  {% if project.link %}
  · <a href="{{ project.link }}">visit →</a>
  {% endif %}
</p>
{% if project.excerpt %}
<p>{{ project.excerpt }}</p>
{% endif %}
{% endfor %}
