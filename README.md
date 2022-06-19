# rack_app
This is an example of a Rack application and middleware 

# Run rack_app
Run rack_app on the default server
```
$ rackup
```
In our case, it's Puma.
```
Puma starting in single mode...
* Puma version: 5.5.2 (ruby 2.7.4-p191) ("Zawgyi")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 9282
* Listening on http://127.0.0.1:9292
* Listening on http://[::1]:9292
Use Ctrl-C to stop
```
Send a request to our rack_up
```
GET "http://127.0.0.1:9292/time?format=year,month,day,hour,minute,second"
```
or
```
curl --url "http://127.0.0.1:9292/time?format=year,month,day,hour,minute,second" -i
```

# Run test
```
rspec spec/requests/ --format documentation
```
