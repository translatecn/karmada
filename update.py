import os
images = [
    'quay.io/submariner/nettest:0.18.1',
    'quay.io/submariner/submariner-operator:0.18.1',
    'quay.io/submariner/lighthouse-coredns:0.18.1',
    'quay.io/submariner/lighthouse-agent:0.18.1',
    'quay.io/submariner/submariner-gateway:0.18.1',
    'quay.io/submariner/submariner-route-agent:0.18.1',
]

clusters = [
    "member1",
    "member2",
    "member3",
]
for image in images:
    os.system(f"docker pull {image}")
    for cluster in clusters:
        os.system(f"kind load docker-image --name {cluster} {image}")


os.system("kind load docker-image --name karmada-host quay.io/submariner/submariner-operator:0.18.1")