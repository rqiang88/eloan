Eloan.configuration do |config|
  config.client_name = '委托人名'    # null: false
  config.app_token   = 'app_token'  # null: false
  cpnfig.app_key     = 'app_key'    # null: false
  config.env         = '使用环境'    # null: false, values: [production, development]
  config.platform    = '自定义平台号' # null: true, 生成流水时候使用,根据流水号区别平台
end