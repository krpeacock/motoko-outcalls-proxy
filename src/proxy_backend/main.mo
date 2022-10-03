import Cycles "mo:base/ExperimentalCycles";
import Text "mo:base/Float";
import Types "Types";

actor {
  public func proxy(url : Text) : async Types.CanisterHttpResponsePayload {

    // Construct canister request
    let request : Types.CanisterHttpRequestArgs = {
      url = url;
      max_response_bytes = null;
      headers = [];
      body = null;
      method = #get;
      transform = ?(#function(transform));
    };
    Cycles.add(220_000_000_000);
    let ic : Types.IC = actor ("aaaaa-aa");
    let response : Types.CanisterHttpResponsePayload = await ic.http_request(request);
    response;
  };

  public query func transform(raw : Types.CanisterHttpResponsePayload) : async Types.CanisterHttpResponsePayload {
    let transformed : Types.CanisterHttpResponsePayload = {
      status = raw.status;
      body = raw.body;
      headers = [
        {
          name = "Content-Security-Policy";
          value = "default-src 'self'";
        },
        { name = "Referrer-Policy"; value = "strict-origin" },
        { name = "Permissions-Policy"; value = "geolocation=(self)" },
        {
          name = "Strict-Transport-Security";
          value = "max-age=63072000";
        },
        { name = "X-Frame-Options"; value = "DENY" },
        { name = "X-Content-Type-Options"; value = "nosniff" },
      ];
    };
    transformed;
  };
};
