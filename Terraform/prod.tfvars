vpc_cidr          = "10.0.0.0/16"
region            = "eu-central-1"
ses_email_reciever = "m_refaat1612@yahoo.com"
machine_details={
    type="t2.micro",
    public_ip=true
}

subnets_details=[
    {
        name="publicSubnet1",
        cidr="10.0.1.0/24",
        type="public",
        az = "eu-central-1a"
    },

    {
        name="publicSubnet2",
        cidr="10.0.2.0/24",
        type="public",
        az = "eu-central-1b"
    },

    {
        name="privateSubnet1",
        cidr="10.0.3.0/24",
        type="private",
        az = "eu-central-1a"
    },
    {
        name="privateSubnet1",
        cidr="10.0.4.0/24",
        type="private",
        az = "eu-central-1b"
    }
]
