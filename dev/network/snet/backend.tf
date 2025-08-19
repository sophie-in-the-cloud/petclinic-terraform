terraform {  
  backend "s3" {  
    bucket       = "njt-tf-state"  
    key          = "dev/network/snet/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}