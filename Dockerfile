#FROM swiftlang/swift:nightly-master-
#FROM swift:amazonlinux2
#FROM swift:ubuntu-latest
FROM swift:latest

#RUN yum -y install git zip

WORKDIR /tmp

ADD Sources ./Sources
ADD Tests ./Tests
ADD Package.swift ./

CMD swift test --enable-test-discovery
