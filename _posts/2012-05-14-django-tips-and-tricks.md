---
layout: post
title: "Django tips and tricks"
description: "Some things I learned about Django"
category: 
tags: []
---
{% include JB/setup %}

Django es un framework tremendamente poderoso, durante estos 4+ años he aprendido algunos trucos que comparto aqui.

This is an ongoing document, I will continue updating it as long as I learn new tricks. Si tienes alguna sugerencia, o ves algo que esta mal, por favor dimelo.

## Usa Vagrant

Normalmente desarrollaba mis paginas en local contra virtualenv y luego hacia el deployment a una instancia de EC2. Crei que era la mejor manera de desarrollar hasta que descubri Vagrant.

### Vagrant?

Vagrant es una herramienta para manejar maquinas virtuales VirtualBox. Nada más.
La gran ventaja de desarrollar con Vagrant es que estas ejecutando tu codigo contra la misma configuración que vas a usar en producción.

Además instalar algunos paquetes (si PIL y Pscycopg2 os miro a vosotros) en OSX no es tarea fácil, con Vagrant es tan sencillo como hacer un apt-get.

Vagrant tiene integracion con Chef y Puppet out-of-the-box, esta es otra gran ventaja.

## Settings management

It's always a good idea to have different files for local and production settings to avoid override it with a version control system. What I do it's to create a `local_settings.py` file and add it to `.gitignore` to keep it out of version control and at the end of `settings.py` I add:

{% highlight python %}
try:
   from local_settings import *
except ImportError, e:
   pass
{% endhighlight %}

Override what you need in `local_settings.py`.

## Fabric


## Usa gunicorn + nginx

### Green Unicorn aka gunicorn

- [Gunicorn](http://gunicorn.org/) es sencillo
- [Gunicorn](http://gunicorn.org/) es ligero

Que más se le puede pedir a un servidor. Aqui un [buen articulo de como configurarlos](http://senko.net/en/django-nginx-gunicorn/) ademas la documentación oficial de Django también incluye una [seccion para integrar con Gunicorn](https://docs.djangoproject.com/en/dev/howto/deployment/wsgi/gunicorn/)

### Nginx

[Nginx](http://nginx.org/en/) (pronounced "engine-ex") is a good choice para usarlo como reverse proxy. Nginx tiene una base de usuarios muy activa y esta bajo active development.


## Usa South

Using South in Django is a no brainer. Actually South must be in Django core. Usually your data model change over time, South let you define migrations, a way to mutate your database schema from one version into another.

The [South tutorial](http://south.aeracode.org/docs/tutorial/index.html) is pretty good.


## Use managers

A manager is the interface to query the models. Managers will increase DRY and increase the abstraction level.

But please before do any manager [read this article from dabapps](http://dabapps.com/blog/higher-level-query-api-django-orm/)

## Soporte con sublime text 2

Durante una larga temporada estuve usando Vim para programar. Al principio fue algo dificil pero al cabo del tiempo te acostumbras y la memoria muscular hace su efecto, tecleas sin pensar. 
Hasta que descubri Sublime Text 2. Desde entonces toooodo me parece más lento.
Vim esta bien, pero requiere un largo aprendizaje y mucha configuración para ponerlo a tu gusto. En una hora con sublime text customize el entorno a mi gusto, instale plugins y aprendi la mitad de los comandos. Además tiene el modo vintage que habilita las key bindings de Vim.

