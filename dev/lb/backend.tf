terraform {  
  backend "s3" {  
    bucket       = "njt-tf-state"  
    key          = "dev/lb/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}