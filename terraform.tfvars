#Create variables for the regions
region = [ "us-east-1", "ap-northeast-1", "eu-west-2", "sa-east-1", "ap-southeast-2", "us-west-1", "ap-east-1"]
#Create variables for the subnets
subnet = {"us-east-1"      = ["us-east-1a", "us-east-1b", "us-east-1c"],
           "ap-northeast-1" = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"],
           "eu-west-2"      = ["eu-west-2a", "eu-west-2b", "eu-west-2c"],
           "sa-east-1"      = ["sa-east-1a", "sa-east-1b"],
           "ap-southeast-2" = ["ap-southeast-2a", "ap-southeast-2b"],
           "us-west-1"      = ["us-west-1a", "us-west-1b", "us-west-1c"],
           "ap-east-1"      = ["ap-east-1a", "ap-east-1b", "ap-east-1c"]}
vpc_cidr_blocks = {
    "us-east-1"      = "10.181.0.0/16",
    "us-west-1"      = "10.182.0.0/16",
    "ap-northeast-1" = "10.183.0.0/16",
    "ap-southeast-2" = "10.184.0.0/16",
    "eu-west-2"      = "10.185.0.0/16",
    "ap-east-1"      = "10.186.0.0/16",
    "sa-east-1"     = "10.187.0.0/16"
}
# Create variables for image ids
image_id = {"us-east-1"      = "ami-0453ec754f44f9a4a",
             "us-west-1"      = "ami-038bba9a164eb3dc1",
             "ap-northeast-1" = "ami-023ff3d4ab11b2525",
             "ap-southeast-2" = "ami-0146fc9ad419e2cfd",
             "eu-west-2"      = "ami-0c76bd4bd302b30ec",
             "ap-east-1"      = "ami-06f707739f2271995",
             "sa-east-1"      = "ami-0c820c196a818d66a"}
# Create variables for providers
alias = {"us-east-1"      = "aws.nyc",
             "us-west-1"      = "aws.cali",
             "ap-northeast-1" = "aws.tokyo",
             "ap-southeast-2" = "aws.aussie",
             "eu-west-2"      = "aws.london",
             "ap-east-1"      = "aws.hongkong",
             "sa-east-1"      = "aws.brazil"}


locale = {"us-east-1"="en_US.UTF-8",
            "ap-northeast-1"="ja_JP.UTF-8","eu-west-2"="en_GB.UTF-8","sa-east-1"="pt_BR.UTF-8","ap-southeast-2"="en_AU.UTF-8","us-west-1"="en_US.UTF-8","ap-east-1"="zh_HK.UTF-8"}
lang = {"us-east-1"="en",
            "ap-northeast-1"="ja","eu-west-2"="en","sa-east-1"="pt","ap-southeast-2"="en","us-west-1"="en","ap-east-1"="zh"}
lc_all = {"us-east-1"="en_US.UTF-8",
            "ap-northeast-1"="ja_JP.UTF-8","eu-west-2"="en_GB.UTF-8","sa-east-1"="pt_BR.UTF-8","ap-southeast-2"="en_AU.UTF-8","us-west-1"="en_US.UTF-8","ap-east-1"="zh_HK.UTF-8"}
            
location = {"us-east-1"="nyc","ap-northeast-1"="tokyo","eu-west-2"="london","sa-east-1"="brazil","ap-southeast-2"="aussie","us-west-1"="cali","ap-east-1"="hk"}
