---
layout: post
title: "My website prelaunch checklist"
description: "Things to check before launch day"
category: 
tags: []
published: true
---
{% include JB/setup %}

This is a document that I've been updating during 3+ years. Obviously It's not mandatory to
meet all the requirements, I just use it as a reference and it helps me to reinforce good practices. Feel free to make suggestions.



### Application testing
- Ensure all test are passing
- Stop verbose error reporting, then check 404 and 500 pages
- Security test 

### Backups
- Set [backup strategy ](http://www.gfi.com/blog/create-complex-secure-backup-strategy/)
- Test backups

### Load time 
- Load test ([blitz.io](), [JMeter](http://jmeter.apache.org/)...) 
- Check number of HTTP requests 
- Add expires headers 
- Put JS at bottom
- Compress/minimize js/css 
- Serve gzipped content
- Optimize images 
- Caching 
- Check indexes in the database 
- Use CDN

### Monitoring
- Server monitoring ([Munin](http://munin-monitoring.org/), [Nagios](http://www.nagios.org/)...)
- Setup web analytics
- Setup Feedburner

### Standards 
- Accesibility validation 
- HTML validation 
- JS validation 
- CSS validation 
- [Opensearch](http://www.opensearch.org/)

### Design 
- Adequate text-to-background contrast 
- Readability 
- Navigation is easy to identify 
- Favicon 
- Apple icons

### Accesibility
- Images with alt text 
- Test different resolutions 
- Test with Internet Explorer 
- Test on mobile devices

### Social 
- Check [Opengraph](http://ogp.me/) tags 
- Add/test social buttons 
- Check social button integration with Google analytics

### SEO 
- Redirect http://www to http:// 
- Check meta tags 
- Add canonical tag to duplicated content
- Sitemap.xml 
- Check url structure 
- Create a robots.txt
- Page titles with keywords 
- Submit to search engines 
- Build some backlinks  
- Ensure semantical content 
