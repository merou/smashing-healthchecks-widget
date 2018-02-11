
# Smashing widget for Healthchecks

[Smashing](https://github.com/Smashing/smashing) is a great and flexible dashboard with can display pretty much anything.  
It scales well on TVs and monitors.  
[Healthchecks](https://github.com/healthchecks/healthchecks) is a Django app which listens for pings (http requests) and trigger alerts (slack, webhook...) when pings are late.   
It is perfect solution when you want a simple monitoring solution.

Since I am using both, I came up with this simple widget.


### Instructions

- cd to your smashing instance.
- copy _**healthchecks.rb**_ inside your _**jobs**_ directory.
- edit _**healthchecks.rb**_ with your own API key.
- add the following lines in your _**dashboards**_ .erb file.

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="2">
 <div data-id="healthchecks" data-view="List" data-unordered="true"
  data-title="HealthChecks.io" style="background-color:#0594CB;"></div>
 <i class="fa fa-tty icon-background"></i>
</li>
```

### Screenshot

![screenshot](smashing_healthcheck.png?raw=true "screenshot")
