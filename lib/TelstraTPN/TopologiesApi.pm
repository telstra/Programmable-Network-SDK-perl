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
package TelstraTPN::TopologiesApi;

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
# ttms100_topology_tag_by_topotaguuid_delete
#
# Delete a topology tag
# 
# @param string $topotaguuid Unique identifier representing a specific topology tag (required)
{
    my $params = {
    'topotaguuid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific topology tag',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'ttms100_topology_tag_by_topotaguuid_delete' } = { 
    	summary => 'Delete a topology tag',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub ttms100_topology_tag_by_topotaguuid_delete {
    my ($self, %args) = @_;

    # verify the required parameter 'topotaguuid' is set
    unless (exists $args{'topotaguuid'}) {
      croak("Missing the required parameter 'topotaguuid' when calling ttms100_topology_tag_by_topotaguuid_delete");
    }

    # parse inputs
    my $_resource_path = '/ttms/1.0.0/topology_tag/{topotaguuid}/';

    my $_method = 'DELETE';
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
    if ( exists $args{'topotaguuid'}) {
        my $_base_variable = "{" . "topotaguuid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'topotaguuid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# ttms100_topology_tag_by_topotaguuid_get
#
# Get information about the specified topology tag
# 
# @param string $topotaguuid Unique identifier representing a specific topology tag (required)
{
    my $params = {
    'topotaguuid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific topology tag',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'ttms100_topology_tag_by_topotaguuid_get' } = { 
    	summary => 'Get information about the specified topology tag',
        params => $params,
        returns => 'Topology',
        };
}
# @return Topology
#
sub ttms100_topology_tag_by_topotaguuid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'topotaguuid' is set
    unless (exists $args{'topotaguuid'}) {
      croak("Missing the required parameter 'topotaguuid' when calling ttms100_topology_tag_by_topotaguuid_get");
    }

    # parse inputs
    my $_resource_path = '/ttms/1.0.0/topology_tag/{topotaguuid}/';

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
    if ( exists $args{'topotaguuid'}) {
        my $_base_variable = "{" . "topotaguuid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'topotaguuid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Topology', $response);
    return $_response_object;
}

#
# ttms100_topology_tag_by_topotaguuid_put
#
# Update a topology tag's name and/or description
# 
# @param string $topotaguuid Unique identifier representing a specific topology tag (required)
# @param Ttms100TopologyTagRequest $body  (optional)
{
    my $params = {
    'topotaguuid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific topology tag',
        required => '1',
    },
    'body' => {
        data_type => 'Ttms100TopologyTagRequest',
        description => '',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'ttms100_topology_tag_by_topotaguuid_put' } = { 
    	summary => 'Update a topology tag&#39;s name and/or description',
        params => $params,
        returns => 'Topology',
        };
}
# @return Topology
#
sub ttms100_topology_tag_by_topotaguuid_put {
    my ($self, %args) = @_;

    # verify the required parameter 'topotaguuid' is set
    unless (exists $args{'topotaguuid'}) {
      croak("Missing the required parameter 'topotaguuid' when calling ttms100_topology_tag_by_topotaguuid_put");
    }

    # parse inputs
    my $_resource_path = '/ttms/1.0.0/topology_tag/{topotaguuid}/';

    my $_method = 'PUT';
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
    if ( exists $args{'topotaguuid'}) {
        my $_base_variable = "{" . "topotaguuid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'topotaguuid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Topology', $response);
    return $_response_object;
}

#
# ttms100_topology_tag_get
#
# List all topology tags
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ 'ttms100_topology_tag_get' } = { 
    	summary => 'List all topology tags',
        params => $params,
        returns => 'ARRAY[Topology]',
        };
}
# @return ARRAY[Topology]
#
sub ttms100_topology_tag_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/ttms/1.0.0/topology_tag';

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

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Topology]', $response);
    return $_response_object;
}

#
# ttms100_topology_tag_objects_by_topotaguuid_get
#
# List objects for Topology
# 
# @param string $topotaguuid Unique identifier representing a specific topology tag (required)
{
    my $params = {
    'topotaguuid' => {
        data_type => 'string',
        description => 'Unique identifier representing a specific topology tag',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'ttms100_topology_tag_objects_by_topotaguuid_get' } = { 
    	summary => 'List objects for Topology',
        params => $params,
        returns => 'Ttms100TopologyTagObjectsResponse',
        };
}
# @return Ttms100TopologyTagObjectsResponse
#
sub ttms100_topology_tag_objects_by_topotaguuid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'topotaguuid' is set
    unless (exists $args{'topotaguuid'}) {
      croak("Missing the required parameter 'topotaguuid' when calling ttms100_topology_tag_objects_by_topotaguuid_get");
    }

    # parse inputs
    my $_resource_path = '/ttms/1.0.0/topology_tag/{topotaguuid}/objects/';

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
    if ( exists $args{'topotaguuid'}) {
        my $_base_variable = "{" . "topotaguuid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'topotaguuid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Ttms100TopologyTagObjectsResponse', $response);
    return $_response_object;
}

#
# ttms100_topology_tag_post
#
# Create a named topology tag
# 
# @param Ttms100TopologyTagRequest $body  (optional)
{
    my $params = {
    'body' => {
        data_type => 'Ttms100TopologyTagRequest',
        description => '',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'ttms100_topology_tag_post' } = { 
    	summary => 'Create a named topology tag',
        params => $params,
        returns => 'Topology',
        };
}
# @return Topology
#
sub ttms100_topology_tag_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/ttms/1.0.0/topology_tag';

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
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Topology', $response);
    return $_response_object;
}

1;
