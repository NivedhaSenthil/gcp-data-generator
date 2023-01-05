require "google/cloud/pubsub"
require_relative "generator" 

def publish_with_compression_async  pubsub, topic_id, data
    topic = pubsub.topic topic_id, async: {compress: true}
    topic.publish_async data
end

def publish_without_compression_async  pubsub, topic_id, data
    topic = pubsub.topic topic_id
    topic.publish_async data
end

def publish_with_compression_sync  pubsub, topic_id, data
    topic = pubsub.topic topic_id
    topic.publish data, compress: true
end

def publish_without_compression_sync  pubsub, topic_id, data
    topic = pubsub.topic topic_id, async: {compress: true}
    topic.publish data
end

def generate_data data_type, data_pattern, data_size
    generator = Generator.new data_type, data_pattern, data_size
    generator.generate
end


def runner topic_id, data_type, data_pattern, data_size
    pubsub = Google::Cloud::Pubsub.new
    data_size = data_size.to_i
    data = generate_data data_type, data_pattern, data_size
    publish_with_compression_async pubsub, topic_id, data
    publish_without_compression_async  pubsub, topic_id, data
    publish_with_compression_sync  pubsub, topic_id, data
    publish_without_compression_sync  pubsub, topic_id, data
end

runner ARGV.shift, ARGV.shift, ARGV.shift, ARGV.shift