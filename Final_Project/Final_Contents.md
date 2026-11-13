## Problem Statement

  To complete this module, you'll need to write a script that processes a bunch of images. It turns out that your company is in the process of updating its website, and a design contractor has been hired to create some new icon graphics for the site. However, the contractor has delivered the final designs and they’re in the wrong format, rotated 90° and too large. You’re unable to get in contact with the designers and your own deadline is approaching fast. You’ll need to use Python to get these images ready for launch! So, how will you do this? You'll need to go through a folder full of images and operate with each of them. On each image, you'll use PIL methods like the ones we saw in the examples, and then write the new images in the right place.

  To complete this module, you'll write a script that interacts with a running web service.  The web service is part of your company's website and is in charge of storing and displaying the customer reviews of the company. The reviews are stored in text files in the local disk. Your script should open those files, process the information to turn it into the format expected by the web service, then send it to the web service to get stored. For this lab, the service is running on the same machine, and you can actually look at how all of it is implemented, if you want.  But you don't need to change the service implementation to complete the exercise.


  To complete this module, you'll have to process information related to the sales your company generated last month, and turn that into a nicely formatted PDF report that you'll then send by email so that your boss can look at it. The lab machine has email configured so that you can check your resulting emails through a nice webmail interface that's already up and running. The system that you'll work with already includes some scripts that will do part of the work for you. You'll need to put these pieces together to get the result you want, basing your code on the one that's already there.

## Python tools for REST APIs

Any programming language can use REST APIs, and of course that includes Python. Python REST API frameworks are toolkits and software libraries that offer the functions and tools needed to build RESTful APIs using the Python programming language. 

**Tools for working with REST APIs in Python break down into two categories: client-side tools for consuming REST APIs and server-side frameworks for serving your own REST APIs.**

### Client-side
    
    REST API client libraries are designed to simplify calling an API and parsing the responses. You could do all of this with the low-level built-in urllib library, but these tools are designed to make the process much easier.

### Requests
    Requests is a third-party Python module that you can easily download and install to simplify sending HTTP requests. It’s easy to use and has been around for a while, so it’s frequently chosen by developers. There are newer derivatives of Requests that are gaining popularity, like HTTPX and AIOHTTP. For a comparison of these three, see 
    HTTPX vs Requests vs AIOHTTP


### PycURL
    As you advance as a developer, you might want to try a client library like PycURL, which offers concurrent connections and can be much faster than Requests. Note that Pycurl is more complicated to install than Requests, and it is not written in pure Python, which can make it harder to learn. 

### Server-side
    On the server side, REST API frameworks are designed to make it easier for you to write, run, and debug REST services by eliminating a lot of the boilerplate code you’d need to receive HTTP requests, parse the URI, and route the request to an appropriate class or method. The most popular REST API server frameworks are Flask, Django, and FastAPI.

### Flask
    Flask is a flexible and comfortable web development framework that is easy to set up and simple to use, which makes it good for beginners. Tools like template engines, for caching, and authentication help developers work quickly. But Flask handles requests sequentially, so although you can get commercial projects going fast using Flask, it isn't good for high load needs. Flask also uses third-party modules, which can make it prone to security breaches. 

***Uber, Pinterest, and Twilio were all built using the Flask framework.***

### Django
    Django is one of the most popular frameworks worldwide. It’s a free, open-source Python framework designed for building websites of any size, with any traffic needs. Django is sturdy and efficient, particularly because it makes use of reusable code. Django is also more secure than Flask, but Django software is much more unwieldy to work with. Developers may find Django slow because of the need to employ reusable modules and the need to check compatibility against previous versions. 

***YouTube, Instagram, Spotify, and DropBox were built with Django.***

### FastAPI
    FastAPI is exactly what the name says: fast. It’s an open-source, high-performing web framework for building web APIs in Python, and it includes hints similar to those in Python. The main downside of FastAPI is how new it is. The FastAPI documentation is robust, but there is not as much in the way of external materials or community for Fast API as there is for Flask and Django. 

***Netflix uses FastAPI internally.*** 


## REST API
RESTful APIs were originally conceptualized by Roy Thomas Fielding in his 2000 PhD thesis. Unlike APIs which directly open up ports to the entire internet and directly connect, RESTful APIs rely on the HTTP protocol. The HTTP protocol, in turn, can be further secured using HTTPS, and API endpoints can authenticate users via authorization tokens, API keys, or other security mechanisms. RESTful APIs use HTTP requests to perform CRUD (create, read, update, delete) operations on resources.

### RESTful methods:

**RESTful APIs work by associating methods (functions) with resources. Some of the most commonly used HTTP request methods are:**

    GET
    : The GET method requests a representation of the specified resource. Requests using GET should only retrieve data.

    HEAD
    : The HEAD method asks for a response identical to a GET request, but without the response body.

    POST
    : The POST method submits an entity to the specified resource, often causing a change in state or side effects on the server.

    PUT
    : The PUT method replaces all current representations of the target resource with the request payload.

    You can use GET to obtain information (called a “request”) from a RESTful API endpoint, which would deliver a replay from the endpoint (called a “response”). Each type of response has a three-digit code associated with it; these are 
    HTTP response codes
    . You might already be familiar with a 404 (not found) response. If a request succeeds, the response status code is 200, and the response will contain a message payload, typically JSON (JavaScript Object Notation). It is important to note that RESTful APIs almost always use JSON, but RESTful APIs can also be used to send and receive files, as well as stream data. 

### JSON
    JSON is a data-interchange format used in RESTful APIs to facilitate communication between clients and servers. In RESTful services, JSON serves as the standard payload format for transmitting data. When a client makes a request, the server processes it and sends back a response, often in JSON format. This structured format allows for easy parsing, ensuring both the server and client can interpret the data consistently. With its key-value pairs, JSON is both human readable and machine friendly, making it a popular choice for web-based APIs.

### Additional protection
    Another important thing to note is that RESTful APIs provide a layer of protection over existing cloud assets, such as a database. Instead of allowing the entire internet to query your database, you can put an API in front of it and allow the API to serve as an intermediary: an endpoint associated with that resource. You can then force authentication using a JavaScript Web Token (JWT) or a third-party authentication provider. This layer of protection not only provides security, but it also separates control logic from data, so that rate-limiting, usage analytics, and caching can be added on top to improve quality of service.

### Compatibility 
    Lastly, RESTful APIs are callable from any programming language that can support HTTP or HTTPS. This includes Python but also C#, JavaScript, Swift, Go, and many others. RESTful APIs, relying on only HTTP, allow any modern computers to talk to each other. 

### Key takeaways
    RESTful APIs are a fundamental and versatile part of web development. Knowing how to design, consume, and work with them is essential for building modern web applications, ensuring they can communicate effectively with other services.






