---
layout: post
title: "My website prelaunch checklist"
description: "Things to check before launch day"
category: 
tags: []
published: true
---
{% include JB/setup %}

This is a document that I've been updating during the latest years. Obviously It's not mandatory to
meet all the requirements, I just use it as a reference and it helps me to reinforce good practices. Feel free to make suggestions.


### Application testing
- Ensure all test are passing
- Stop verbose error reporting, then check 404 and 500 pages

### Backups
- Set [backup strategy ](https://blog.sucuri.net/2015/04/how-to-create-a-website-backup-strategy.html)
- Test backups

### Load time 
- Load test ([blitz.io](), [JMeter](http://jmeter.apache.org/)...) 
- Check number of HTTP requests 
- Add expires headers 
- Move JS to the bottom
- Compress/minimize js/css 
- Check if server it's serving gzipped content
- Optimize images 
- Enable caching 
- Check indexes in the database 
- Configure CDN

### Monitoring
- Server monitoring ([Munin](http://munin-monitoring.org/), [Nagios](http://www.nagios.org/)...)
- Setup web analytics
- Setup Feedburner

### Standards 
- HTML/JS/CSS validation 
- If the site use search, check [Opensearch](http://www.opensearch.org/)

### Design 
- Check if the text-to-background contrast is adequate
- Page readability 
- Navigation is easy to identify?
- Favicon and mobile icons

### Accesibilito
- [Accesibility validation](http://wave.webaim.org/)
- Images with alt text 
- Test different resolutions and font sizes
- Test on mobile devices

### Social 
- Check [Opengraph](http://ogp.me/) tags 
- Add/test social buttons 
- Check social button integration with Google analytics

### SEO 
- Redirect http://www to http:// 
- Check meta tags 
- Add [canonical tag](http://positionly.com/blog/seo/canonical-url-tag) to duplicated content
- Sitemap.xml 
- Check url structure 
- Create a [robots.txt](https://developers.google.com/webmasters/control-crawl-index/docs/robots_txt)
- Submit to search engines 
- Build some backlinks

### Legal stuff
- Check terms and conditions
- EU cookie law

### Security
- [Check HTTPS](https://www.ssllabs.com/ssltest/)
- Scan vulnerabilities with an automatic tool
- CSRF token