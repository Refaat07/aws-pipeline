vpc_cidr          = "10.0.0.0/16"
region            = "us-east-1"
machine_details={
    type="t2.micro",
    public_ip=true
}

subnets_details=[
    {
        name="publicSubnet1",
        cidr="10.0.1.0/24",
        type="public",
        az = "us-east-1a"
    },

    {
        name="publicSubnet2",
        cidr="10.0.2.0/24",
        type="public",
        az = "us-east-1b"
    },

    {
        name="privateSubnet1",
        cidr="10.0.3.0/24",
        type="private",
         az = "us-east-1a"
    },
    {
        name="privateSubnet2",
        cidr="10.0.4.0/24",
        type="private",
        az = "us-east-1b"
    }
]
