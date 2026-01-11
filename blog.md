---
layout: default
title: Blog
---

{% for post in site.posts %}
<p>
  <a href="{{ post.url }}">{{ post.title }}</a><br>
  <small>{{ post.date | date: "%B %d, %Y" }}</small>
</p>
{% endfor %}