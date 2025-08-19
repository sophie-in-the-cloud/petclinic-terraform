terraform {  
  backend "s3" {  
    bucket       = "njt-tf-state"  
    key          = "dev/db/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}