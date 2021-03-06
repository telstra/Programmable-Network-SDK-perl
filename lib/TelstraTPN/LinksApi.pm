=begin comment

Telstra Programmable Network API

Telstra Programmable Network is a self-provisioning platform that allows its users to create on-demand connectivity services between multiple end-points and add various network functions to those services. Programmable Network enables to connectivity to a global ecosystem of networking services as well as public and private cloud services. Once you are connected to the platform on one or more POPs (points of presence), you can start creating those services based on the use case that you want to accomplish. The Programmable Network API is available to all customers who have registered to use the Programmable Network. To register, please contact your account representative.

OpenAPI spec version: 2.1.3

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package TelstraTPN::LinksApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use TelstraTPN::ApiClient;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class = shift;
    my $api_client;

    if ($_[0] && ref $_[0] && ref $_[0] eq 'TelstraTPN::ApiClient' ) {
        $api_client = $_[0];
    } else {
        $api_client = TelstraTPN::ApiClient->new(@_);
    }

    bless { api_client => $api_client }, $class;

}


#
# inventory_link_post
#
# Create Link and initial Contract
# 
# @param InventoryLinkRequest $body  (optional)
{
    my $params = {
    'body' => {
        data_type => 'InventoryLinkRequest',
        description => '',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'inventory_link_post' } = { 
    	summary => 'Create Link and initial Contract',
        params => $params,
        returns => 'InventoryLinkResponse',
        };
}
# @return InventoryLinkResponse
#
sub inventory_link_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/1.0.0/inventory/link';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(auth )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InventoryLinkResponse', $response);
    return $_response_object;
}

#
# inventory_links_by_linkid_get
#
# Get details of specified link
# 
# @param string $linkid Unique identifier representing a specific link (required)
{
    my $params = {
    'linkid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific link',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'inventory_links_by_linkid_get' } = { 
    	summary => 'Get details of specified link',
        params => $params,
        returns => 'InventoryLinksResponse',
        };
}
# @return InventoryLinksResponse
#
sub inventory_links_by_linkid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'linkid' is set
    unless (exists $args{'linkid'}) {
      croak("Missing the required parameter 'linkid' when calling inventory_links_by_linkid_get");
    }

    # parse inputs
    my $_resource_path = '/1.0.0/inventory/links/{linkid}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # path params
    if ( exists $args{'linkid'}) {
        my $_base_variable = "{" . "linkid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'linkid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(auth )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InventoryLinksResponse', $response);
    return $_response_object;
}

#
# inventory_links_customer_by_customeruuid_get
#
# Get active Links
# 
# @param string $customeruuid Unique identifier representing a specific customer (required)
{
    my $params = {
    'customeruuid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific customer',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'inventory_links_customer_by_customeruuid_get' } = { 
    	summary => 'Get active Links',
        params => $params,
        returns => 'ARRAY[Link]',
        };
}
# @return ARRAY[Link]
#
sub inventory_links_customer_by_customeruuid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'customeruuid' is set
    unless (exists $args{'customeruuid'}) {
      croak("Missing the required parameter 'customeruuid' when calling inventory_links_customer_by_customeruuid_get");
    }

    # parse inputs
    my $_resource_path = '/1.0.0/inventory/links/customer/{customeruuid}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # path params
    if ( exists $args{'customeruuid'}) {
        my $_base_variable = "{" . "customeruuid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'customeruuid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(auth )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Link]', $response);
    return $_response_object;
}

#
# inventory_links_history_by_linkid_get
#
# Get Link history
# 
# @param string $linkid Unique identifier representing a specific link (required)
{
    my $params = {
    'linkid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific link',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'inventory_links_history_by_linkid_get' } = { 
    	summary => 'Get Link history',
        params => $params,
        returns => 'InventoryLinksHistoryResponse',
        };
}
# @return InventoryLinksHistoryResponse
#
sub inventory_links_history_by_linkid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'linkid' is set
    unless (exists $args{'linkid'}) {
      croak("Missing the required parameter 'linkid' when calling inventory_links_history_by_linkid_get");
    }

    # parse inputs
    my $_resource_path = '/1.0.0/inventory/links/history/{linkid}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # path params
    if ( exists $args{'linkid'}) {
        my $_base_variable = "{" . "linkid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'linkid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(auth )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InventoryLinksHistoryResponse', $response);
    return $_response_object;
}

1;
