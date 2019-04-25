Eloan.configuration do |config|
  config.client_name  = '委托人名'    # null: false
  config.app_token    = 'app_token'  # null: false
  config.app_key      = 'app_key'    # null: false
  config.company_name = 'YLPH'   # null: false, 生产环境请替换
  config.env          = '使用环境'    # null: false, values: [production, development]
  config.platform     = '自定义平台号' # null: false, 生成流水时候使用,根据流水号区别平台
  config.bg_return_url = ''          # null: false 异步通知回调地址
end