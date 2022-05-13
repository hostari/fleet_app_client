# fleet_app_client

TODO: Write a description here

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     fleet_app_client:
       github: hostari/fleet_app_client
   ```

2. Run `shards install`

## Usage

```crystal
require "fleet_app_client"
```

Build a new FleetApp client.

```crystal
client = FleetApp::Client.new
```

## Resource Methods

Start a Server
```crystal
FleetApp::Server.start("2012197.xyz", "valheim", "1234")
```

Stop a Server
```crystal
FleetApp::Server.stop("2012197.xyz", "valheim", "1234")
```

Restart a Server
```crystal
FleetApp::Server.restart("2012197.xyz", "valheim", "1234")
```

Create a Server
```crystal
FleetApp::Server.create("2012197.xyz", "valheim", "1234")
```

Get Server Details (For Other Games)
```crystal
FleetApp::Server.get_details("2012197.xyz", "valheim", "1234")
```

Get CoreKeeper Game ID
```crystal
FleetApp::Server.get_details("2012197.xyz", "core_keeper", "1234")
```



## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/fleet_app_client/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Pauline De Polonia](https://github.com/your-github-user) - creator and maintainer
