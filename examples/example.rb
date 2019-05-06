# 备注: 所有有默认值字段后台自动加入参数中,如果上传参数中含有默认值字段,优先使用上传参数
# 文档: http://api.cloudpnr.com/eloan/eloan.html
# 有任何疑问请查看以上文档


# 个人开户绑卡
# code = 101
# cert_id String  是 最长20  身份证号码
# user_name String  是 最长80  用户姓名
# card_no String  是 最长20  银行卡号
# bank_id String  是 定长8 银行代码
# bank_mobile String  是 定长11  银行预留手机号
data = {
  'cert_id' => '222424200009250021',
  'user_name' => '香雪海',
  'card_no' => '6232510000008863',
  'bank_id' => '01050000',
  'bank_mobile' => '15200152000'
}
Eloan.api.pay(101, data)

# 个人开户代扣签约绑卡(102)
# code = 102
# cert_id String  是 最长20  身份证号码
# user_name String  是 最长80  用户姓名
# card_no String  是 最长20  银行卡号
# bank_mobile String  是 定长11  银行预留手机号
# bank_id String  是 定长8 银行代码
# bind_trans_id String  是 最长20  绑卡请求流水2次调用代扣签约绑卡请求流水必须一致且需为字母+数字
# step_flag String  是 定长2 阶段标志01-下发短信阶段02-绑卡确认阶段
# sms_code  String  否 定长6 step_flag为01时不填，step_flag为02时必填
data = {
  'cert_id' => '222424200009250021',
  'user_name' => '香雪海',
  'card_no' => '6232510000008863',
  'bank_id' => '01050000',
  'bank_mobile' => '15200152000'
  'bind_trans_id' => 'pay102',
  'step_flag' => '02',
  'sms_code' => '111111'
}
Eloan.api.pay(102, data)

# 代扣卡解绑
# code = 103
# cert_id String  是 最长20  身份证号码
# user_name String  是 最长80  用户姓名
# card_no String  是 最长20  银行卡号
data = {
  'cert_id' => '222424200009250021',
  'user_name' => '香雪海',
  'card_no' => '6232510000008863'
}
Eloan.api.pay(103, data)

# 放款
# code = 201
# loan_start_date String  是 定长8 贷款开始日期，yyyymmdd
# loan_end_date String  是 定长8 贷款结束日期，yyyymmdd
# loan_period String  是 最长4 期限，结合期限类型的数字 default: 1
# loan_period_type  String  是 定长2 期限类型：00-年；01-月；02-日 default: 01
# contract_no String  否 最长80  借款合同编号
# loan_amount String  是 最长14  放款总额，小数点后两位数字 #.##，须大于 5.00元
# entrusted_flag  String  是 定长1 是否受托支付：Y-是；N-否, default: N
# user_cert_id  String  是 最长20  借款人身份证号码
# user_name String  是 最长80  借款人姓名
# user_card_no  String  是 最长20  借款人银行卡号
# user_amount String  是 最长14  借款人金额，小数点后两位数字 #.##
# user_cash_method  String  是 定长2 取现方式：T0：即时到账，手续费较高；T1：第二日到账，手续费较低, default: T1
# merchant_cert_type  String  否 定长2 受托商户证件类型，受托支付时必填：00-普通营业执照企业； 01-三证合一企业
# merchant_cert_id  String  否 最长30  受托商户证件号码，受托支付时必填
# merchant_amount String  否 最长14  受托商户金额，小数点后两位数字#.##，受托支付时必填
# installment_number  String  是 最长3 分期期数
# installment_rate  String  是 最长5 分期利率，年化<=36.00%，小数点后两位数字#.##， 如22.22%，传参为：22.22
# payment_method  String  是 定长2 还款方式：00-等额本息；01-等额本金；02-一次性还本付息； 03-先息后本(即按频率付息、一次还本)
# loan_comment  String  否 最长256 备注
# auditor String  否 最长64  审核人
# audit_time  String  否 定长14  审核时间，yyyymmddhhmmss
# bg_return_url String  是 最长256 
data = {
  'loan_start_date' => '20190425',
  'loan_end_date' => '20190525',
  'loan_amount' => '10.00',
  'user_cert_id' =>  '222424000009250021',
  'user_name' => '香雪海',
  'user_card_no' => '6232510000008863',
  'user_amount' => '10.00',
  'installment_rate' => '10.00'
}
Eloan.api.pay('201', data)

# 还款代扣接口
# code = 202
# cert_id String  是 最长20  身份证号码
# user_name String  是 最长80  借款人姓名
# card_no String  是 最长20  卡号
# repay_mode  String  是 定长1 还款方式0-自动代扣，1-主动还款 default: 1
# trans_amt String  是 最长14  代扣金额，保留2位有效数字
# loan_request_seq  String  是 最长40  放款请求流水号
# back_cert_type  String  是 变长2 回款收款方证件类型00-身份证，1-普通营业执照企业，2-三证合一企业
# back_cert_id  String  是 最长20  回款收款方证件号
# back_div_details  String  否 最长512 回款方分账串信息，JSON数组方式
data = {
  'cert_id' => '222424000009250021',
  'user_name' => '香雪海',
  'card_no' => '6232510000008863'
  'trans_amt' => '10.00'
  'loan_request_seq' => 'test201904258866',
  'back_cert_id' => '222424000009250021'
}
Eloan.api.pay(202, data)

# 放款取现
# code = 204
# loan_request_seq  String  是 最长40  放款请求流水号
# card_no String  是 最长20  借款人银行卡号
data = {
  'loan_request_seq' => 'test201904258866',
  'card_no' => '6232510000008863'
}
Eloan.api.pay(204, data)

# 个人开户绑卡查询
# code = 301
# bind_request_seq  String  否 最长40  该笔请求流水号
# cert_id String  是 最长20  身份证号
# card_no String  是 最长20  银行卡号
data = {
  'cert_id' => '222424200009250021',
  'card_no' => '6232510000008863'
}
Eloan.api.pay(301, data)

# 放款查询
# code = 302
# bind_request_seq  String  否 最长40  该笔请求流水号
data = {
  'loan_request_seq' => 'test201904258866'
}
Eloan.api.pay(302, data)

# 个人开户代扣签约绑卡查询
# code = 303
# cert_id String  是 最长20  身份证号码
data = {
  'cert_id' => '222424200009250021',
  'card_no' => '6232510000008863'
}
Eloan.api.pay(303, data)

# 还款查询
# code = 304
# repay_request_seq String  是 最长40  该笔请求流水号
data = {
  'repay_request_seq' => 'test201904258866'
}
Eloan.api.pay(304, data)

# 卡BIN查询
# code = 305
# cert_id String  是 最长20  身份证号码
data = {
  'card_no' => '6232510000008863'
}
Eloan.api.pay(305, data)

# 绑卡信息查询
# code = 306
# cert_id String  是 最长20  身份证号码
data = {
  'cert_id' => '222424199309250021'
}
Eloan.api.pay(306, data)

# 放款取现查询
# code = 307
# cash_request_seq  String  是 最长40  放款取现请求流水号
data = {
  'cash_request_seq' => 'test201904258866'
}
Eloan.api.pay(307, data)

# 委托人余额查询
# code = 308
Eloan.api.pay(308)
