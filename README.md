# Motoko HTTP Outcall Example

This example showcases the use of HTTP outcalls in the Motoko programming language. It is a simple proxy of an HTTP call to an arbitrary endpoint.

How to Use
Install the dfx command-line interface, if you haven't already:

```
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
```

In the root directory of this example, deploy the code:

```
dfx deploy
```

Call the proxy function, passing a URL as an argument:

```
dfx canister call proxy_backend proxy "https://official-joke-api.appspot.com/random_joke"
```

Code Explanation
The proxy function takes a URL as an argument and returns an asynchronous Types.CanisterHttpResponsePayload containing the response from the endpoint.

The transform function is used to add security headers to the response from the endpoint. It takes a Types.TransformArgs object as an argument and returns an asynchronous Types.CanisterHttpResponsePayload object.
