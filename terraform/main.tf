module "buckets" {
  source = "./modules/buckets"
}

module "lambdas" {
  source = "./modules/lambdas"
  #  source_bucket_id  = module.buckets.source_bucket_id
  source_bucket_arn = module.buckets.source_bucket_arn
  #  destination_bucket_id    = module.buckets.destination_bucket_id
  destination_bucket_arn = module.buckets.destination_bucket_arn
}
