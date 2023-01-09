# gcp-data-generator
A tool to generate synthetic and twitter like realistic data for tests.

This uses thrift objects for constructing twitter like data. 
The class files are generated and resides in `resource/gen-rb` folder.

It has two parts one is the generator that creates data for the given size in bytes, 
data type ( realistic or synthetic) and data pattern (repeated, semi-repeated or random).
Other one is the runner that uses the data generated and publishes to pubsub with compression 
enabled and disabled.

## Run

Prerequisites ruby and thrift.

### Generate data into file

- clone the repo
- `bundle install`
- `bundle exec ruby ./message_generator.rb "test.txt" "realistic" "semi_repeated" "2000"`

### Publish data to pubsub

- clone the repo
- `bundle install`
- `bundle exec ruby ./runner.rb "test" "realistic" "semi_repeated" "2000"`

Runner takes 4 arguments topic_id, data type, data pattern and data size.
Configure and authenticate the GCP project before running this.
