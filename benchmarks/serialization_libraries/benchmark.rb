require 'rails/all'
Bundler.require(*Rails.groups)

ActiveRecord::Base.logger = nil
ActiveModelSerializers.logger = nil
ActiveModelSerializers.config.adapter = :json_api
ActiveModelSerializers.config.key_transform = :unaltered

require './support/rails'
require './support/bench_helper'

# AMS
require './support/serializers/user_serializer.rb'
require './support/serializers/post_serializer'
require './support/serializers/comment_serializer'
# jsonapi-rb
require 'jsonapi/serializable'
require './support/serializers/serializable_comment'
require './support/serializers/serializable_post'
require './support/serializers/serializable_user'
# barley
require './support/serializers/comment_barley_serializer'
require './support/serializers/post_barley_serializer'
require './support/serializers/user_barley_serializer'
require './support/model/user'
require './support/model/post'
require './support/model/comment'

GC.disable

%i[ips memory].each do |bench|
  BenchHelper.clear_data
  BenchHelper.seed_data

  Benchmark.send(bench) do |x|
    x.config(time: 10, warmup: 5, stats: :bootstrap, confidence: 95) if x.respond_to?(:config)

    x.report('ams               ') { BenchHelper.test_render(:ams) }
    x.report('jsonapi-rb        ') { BenchHelper.test_render(:jsonapi_rb) }
    x.report('barley            ') { BenchHelper.test_render(:barley) }
    x.report('barley-cache      ') { BenchHelper.test_render(:barley_cache) }
    x.report('ams          eager') { BenchHelper.test_manual_eagerload(:ams) }
    x.report('jsonapi-rb   eager') { BenchHelper.test_manual_eagerload(:jsonapi_rb) }
    x.report('barley       eager') { BenchHelper.test_manual_eagerload(:barley) }
    x.report('barley-cache eager') { BenchHelper.test_manual_eagerload(:barley_cache) }

    x.compare!
  end
end
