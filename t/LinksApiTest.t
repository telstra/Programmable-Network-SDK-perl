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

use_ok('TelstraTPN::LinksApi');

my $api = TelstraTPN::LinksApi->new();
isa_ok($api, 'TelstraTPN::LinksApi');

#
# create_link_and_initial_contract test
#
{
    my $body = undef; # replace NULL with a proper value
    my $result = $api->create_link_and_initial_contract(body => $body);
}

#
# get_active_links test
#
{
    my $customeruuid = undef; # replace NULL with a proper value
    my $result = $api->get_active_links(customeruuid => $customeruuid);
}

#
# get_details_of_specified_link test
#
{
    my $linkid = undef; # replace NULL with a proper value
    my $result = $api->get_details_of_specified_link(linkid => $linkid);
}

#
# get_link_history test
#
{
    my $linkid = undef; # replace NULL with a proper value
    my $result = $api->get_link_history(linkid => $linkid);
}


1;