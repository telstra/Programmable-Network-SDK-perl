=begin comment

Telstra Programmable Network API

Telstra Programmable Network is a self-provisioning platform that allows its users to create on-demand connectivity services between multiple end-points and add various network functions to those services. Programmable Network enables to connectivity to a global ecosystem of networking services as well as public and private cloud services. Once you are connected to the platform on one or more POPs (points of presence), you can start creating those services based on the use case that you want to accomplish. The Programmable Network API is available to all customers who have registered to use the Programmable Network. To register, please contact your account representative.

OpenAPI spec version: 2.1.2

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by Swagger Codegen
# Please update the test cases below to test the API endpoints.
# Ref: https://github.com/swagger-api/swagger-codegen
#
use Test::More tests => 1; #TODO update number of test cases
use Test::Exception;

use lib 'lib';
use strict;
use warnings;

use_ok('TelstraTPN::EndpointsApi');

my $api = TelstraTPN::EndpointsApi->new();
isa_ok($api, 'TelstraTPN::EndpointsApi');

#
# create_physical__port_endpoint test
#
{
    my $body = undef; # replace NULL with a proper value
    my $result = $api->create_physical__port_endpoint(body => $body);
}

#
# create_vnf_endpoint test
#
{
    my $body = undef; # replace NULL with a proper value
    my $result = $api->create_vnf_endpoint(body => $body);
}

#
# get_information_about_the_specified_endpoint test
#
{
    my $endpointuuid = undef; # replace NULL with a proper value
    my $result = $api->get_information_about_the_specified_endpoint(endpointuuid => $endpointuuid);
}

#
# get_list_of_endpoints_for_a_customer test
#
{
    my $customeruuid = undef; # replace NULL with a proper value
    my $result = $api->get_list_of_endpoints_for_a_customer(customeruuid => $customeruuid);
}


1;