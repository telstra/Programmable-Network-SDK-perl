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
package TelstraTPN::CustomersApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use TelstraTPN::ApiClient;
use TelstraTPN::Configuration;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class   = shift;
    my (%self) = (
        'api_client' => TelstraTPN::ApiClient->instance,
        @_
    );

    #my $self = {
    #    #api_client => $options->{api_client}
    #    api_client => $default_api_client
    #}; 

    bless \%self, $class;

}


#
# 100_account_by_customeruuid_get
#
# Get account information details
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
    __PACKAGE__->method_documentation->{ '100_account_by_customeruuid_get' } = { 
    	summary => 'Get account information details',
        params => $params,
        returns => 'Model100AccountResponse',
        };
}
# @return Model100AccountResponse
#
sub 100_account_by_customeruuid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'customeruuid' is set
    unless (exists $args{'customeruuid'}) {
      croak("Missing the required parameter 'customeruuid' when calling 100_account_by_customeruuid_get");
    }

    # parse inputs
    my $_resource_path = '/1.0.0/account/{customeruuid}';

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
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Model100AccountResponse', $response);
    return $_response_object;
}

#
# 100_account_user_by_customeruuid_get
#
# List users
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
    __PACKAGE__->method_documentation->{ '100_account_user_by_customeruuid_get' } = { 
    	summary => 'List users',
        params => $params,
        returns => 'ARRAY[User]',
        };
}
# @return ARRAY[User]
#
sub 100_account_user_by_customeruuid_get {
    my ($self, %args) = @_;

    # verify the required parameter 'customeruuid' is set
    unless (exists $args{'customeruuid'}) {
      croak("Missing the required parameter 'customeruuid' when calling 100_account_user_by_customeruuid_get");
    }

    # parse inputs
    my $_resource_path = '/1.0.0/account/{customeruuid}/user';

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
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[User]', $response);
    return $_response_object;
}

1;
