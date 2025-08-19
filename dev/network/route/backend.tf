terraform {  
  backend "s3" {  
    bucket       = "njt-tf-state"  
    key          = "dev/network/route/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}