# NAME

TelstraTPN::Role - a Moose role for the Telstra Programmable Network API

Telstra Programmable Network is a self-provisioning platform that allows its users to create on-demand connectivity services between multiple end-points and add various network functions to those services. Programmable Network enables to connectivity to a global ecosystem of networking services as well as public and private cloud services. Once you are connected to the platform on one or more POPs (points of presence), you can start creating those services based on the use case that you want to accomplish. The Programmable Network API is available to all customers who have registered to use the Programmable Network. To register, please contact your account representative.

# VERSION

- API version: 2.1.3
- Package version: 1.0.0

## A note on Moose

This role is the only component of the library that uses Moose. See
TelstraTPN::ApiFactory for non-Moosey usage.

# SYNOPSIS

The Perl Swagger Codegen project builds a library of Perl modules to interact with
a web service defined by a OpenAPI Specification. See below for how to build the
library.

This module provides an interface to the generated library. All the classes,
objects, and methods (well, not quite \*all\*, see below) are flattened into this
role.

        package MyApp;
        use Moose;
        with 'TelstraTPN::Role';

        package main;

        my $api = MyApp->new({ tokens => $tokens });

        my $pet = $api->get_pet_by_id(pet_id => $pet_id);


## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint.

Additionally, there is a set of "object" classes, which represent the objects
returned by and sent to the methods on the endpoints.

An API factory class is provided, which builds instances of each endpoint API.

This Moose role flattens all the methods from the endpoint APIs onto the consuming
class. It also provides methods to retrieve the endpoint API objects, and the API
factory object, should you need it.

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,

        # oauth
        access_token => $oauth_token,

        # keys
        $some_key => { token => $token,
                       prefix => $prefix,
                       in => $in,             # 'head||query',
                       },

        $another => { token => $token,
                      prefix => $prefix,
                      in => $in,              # 'head||query',
                      },
        ...,

        };

        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string.

The tokens will be placed in a L<TelstraTPN::Configuration> instance
as follows, but you don't need to know about this.

- `$cfg->{username}`

    String. The username for basic auth.

- `$cfg->{password}`

    String. The password for basic auth.

- `$cfg->{api_key}`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $cfg->{api_key} = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$cfg->{api_key_prefix}`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $cfg->{api_key_prefix} = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$cfg->{access_token}`

    String. The OAuth access token.

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method
returns the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly.

        $self->api_factory('Pet'); # returns a TelstraTPN::PetApi instance

        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable
method names. In practice, because of the way method names are constructed, it's
unlikely in general that any methods will be undelegatable, except for:

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://github.com/swagger-api/swagger-codegen` for full details.
But briefly, clone the git repository, build the codegen codebase, set up your build
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library:

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/swagger-api/swagger-codegen.git
          $ cd swagger-codegen
          $ mvn package
          $ java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
    -i [URL or file path to JSON swagger API spec] \
    -l perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API
you just built.

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format
    -H           HTML format
    -m           Markdown format
    -h           print this help message
    -c           your application class


The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the Swagger
spec. If so, this is available via the `class_documentation()` and
`method_documentation()` methods on each generated object class, and the
`method_documentation()` method on the endpoint API classes:

        my $cmdoc = $api->pet_api->method_documentation->{$method_name};

        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name};


Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use TelstraTPN::AuthenticationApi;
use TelstraTPN::ContractsApi;
use TelstraTPN::CustomersApi;
use TelstraTPN::DatacentresApi;
use TelstraTPN::EndpointsApi;
use TelstraTPN::LinksApi;
use TelstraTPN::TopologiesApi;
use TelstraTPN::VnfsApi;
use TelstraTPN::VportsApi;

```

To load the models:
```perl
use TelstraTPN::Object::AccountResponse;
use TelstraTPN::Object::AuthGeneratetokenResponse;
use TelstraTPN::Object::AuthValidatetokenResponse;
use TelstraTPN::Object::Billing;
use TelstraTPN::Object::Classification;
use TelstraTPN::Object::Contract;
use TelstraTPN::Object::Datacenter;
use TelstraTPN::Object::Eis100EndpointsAssignTopologyTagRequest;
use TelstraTPN::Object::Endpoint;
use TelstraTPN::Object::EndpointPort;
use TelstraTPN::Object::Endpointlist;
use TelstraTPN::Object::Error;
use TelstraTPN::Object::Error74;
use TelstraTPN::Object::Flavor;
use TelstraTPN::Object::GlanceImage;
use TelstraTPN::Object::InventoryDatacenters401Error;
use TelstraTPN::Object::InventoryDatacentersResponse;
use TelstraTPN::Object::InventoryEndpointResponse;
use TelstraTPN::Object::InventoryEndpointsCustomeruuidResponse;
use TelstraTPN::Object::InventoryLinkRequest;
use TelstraTPN::Object::InventoryLinkResponse;
use TelstraTPN::Object::InventoryLinksContractRequest;
use TelstraTPN::Object::InventoryLinksContractRequest37;
use TelstraTPN::Object::InventoryLinksContractResponse;
use TelstraTPN::Object::InventoryLinksContractResponse33;
use TelstraTPN::Object::InventoryLinksContractResponse38;
use TelstraTPN::Object::InventoryLinksHistoryResponse;
use TelstraTPN::Object::InventoryLinksResponse;
use TelstraTPN::Object::InventoryRegularendpointRequest;
use TelstraTPN::Object::InventoryRegularendpointResponse;
use TelstraTPN::Object::InventoryRegularvportRequest;
use TelstraTPN::Object::InventoryRegularvportResponse;
use TelstraTPN::Object::InventoryVnfVportRequest;
use TelstraTPN::Object::InventoryVnfVportResponse;
use TelstraTPN::Object::InventoryVnfendpointRequest;
use TelstraTPN::Object::InventoryVnfendpointResponse;
use TelstraTPN::Object::Link;
use TelstraTPN::Object::Link66;
use TelstraTPN::Object::MarketplaceImageResponse;
use TelstraTPN::Object::Meta;
use TelstraTPN::Object::Object52;
use TelstraTPN::Object::Params;
use TelstraTPN::Object::Params31;
use TelstraTPN::Object::Params34;
use TelstraTPN::Object::Params39;
use TelstraTPN::Object::Product;
use TelstraTPN::Object::Role;
use TelstraTPN::Object::SuccessFragment;
use TelstraTPN::Object::Topology;
use TelstraTPN::Object::Ttms100TopologyTagObjectsResponse;
use TelstraTPN::Object::Ttms100TopologyTagRequest;
use TelstraTPN::Object::User;
use TelstraTPN::Object::Vlan;
use TelstraTPN::Object::VnfTag;
use TelstraTPN::Object::Vport;
use TelstraTPN::Object::Vportvalue;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use TelstraTPN::AuthenticationApi;
use TelstraTPN::ContractsApi;
use TelstraTPN::CustomersApi;
use TelstraTPN::DatacentresApi;
use TelstraTPN::EndpointsApi;
use TelstraTPN::LinksApi;
use TelstraTPN::TopologiesApi;
use TelstraTPN::VnfsApi;
use TelstraTPN::VportsApi;

# load the models
use TelstraTPN::Object::AccountResponse;
use TelstraTPN::Object::AuthGeneratetokenResponse;
use TelstraTPN::Object::AuthValidatetokenResponse;
use TelstraTPN::Object::Billing;
use TelstraTPN::Object::Classification;
use TelstraTPN::Object::Contract;
use TelstraTPN::Object::Datacenter;
use TelstraTPN::Object::Eis100EndpointsAssignTopologyTagRequest;
use TelstraTPN::Object::Endpoint;
use TelstraTPN::Object::EndpointPort;
use TelstraTPN::Object::Endpointlist;
use TelstraTPN::Object::Error;
use TelstraTPN::Object::Error74;
use TelstraTPN::Object::Flavor;
use TelstraTPN::Object::GlanceImage;
use TelstraTPN::Object::InventoryDatacenters401Error;
use TelstraTPN::Object::InventoryDatacentersResponse;
use TelstraTPN::Object::InventoryEndpointResponse;
use TelstraTPN::Object::InventoryEndpointsCustomeruuidResponse;
use TelstraTPN::Object::InventoryLinkRequest;
use TelstraTPN::Object::InventoryLinkResponse;
use TelstraTPN::Object::InventoryLinksContractRequest;
use TelstraTPN::Object::InventoryLinksContractRequest37;
use TelstraTPN::Object::InventoryLinksContractResponse;
use TelstraTPN::Object::InventoryLinksContractResponse33;
use TelstraTPN::Object::InventoryLinksContractResponse38;
use TelstraTPN::Object::InventoryLinksHistoryResponse;
use TelstraTPN::Object::InventoryLinksResponse;
use TelstraTPN::Object::InventoryRegularendpointRequest;
use TelstraTPN::Object::InventoryRegularendpointResponse;
use TelstraTPN::Object::InventoryRegularvportRequest;
use TelstraTPN::Object::InventoryRegularvportResponse;
use TelstraTPN::Object::InventoryVnfVportRequest;
use TelstraTPN::Object::InventoryVnfVportResponse;
use TelstraTPN::Object::InventoryVnfendpointRequest;
use TelstraTPN::Object::InventoryVnfendpointResponse;
use TelstraTPN::Object::Link;
use TelstraTPN::Object::Link66;
use TelstraTPN::Object::MarketplaceImageResponse;
use TelstraTPN::Object::Meta;
use TelstraTPN::Object::Object52;
use TelstraTPN::Object::Params;
use TelstraTPN::Object::Params31;
use TelstraTPN::Object::Params34;
use TelstraTPN::Object::Params39;
use TelstraTPN::Object::Product;
use TelstraTPN::Object::Role;
use TelstraTPN::Object::SuccessFragment;
use TelstraTPN::Object::Topology;
use TelstraTPN::Object::Ttms100TopologyTagObjectsResponse;
use TelstraTPN::Object::Ttms100TopologyTagRequest;
use TelstraTPN::Object::User;
use TelstraTPN::Object::Vlan;
use TelstraTPN::Object::VnfTag;
use TelstraTPN::Object::Vport;
use TelstraTPN::Object::Vportvalue;

# for displaying the API response data
use Data::Dumper;
use TelstraTPN::;

my $api_instance = TelstraTPN::->new(
);

my $grant_type = 'grant_type_example'; # string | 
my $username = 'username_example'; # string | 
my $password = 'password_example'; # string | 

eval {
    my $result = $api_instance->auth_generatetoken_post(grant_type => $grant_type, username => $username, password => $password);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AuthenticationApi->auth_generatetoken_post: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://penapi.pacnetconnect.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthenticationApi* | [**auth_generatetoken_post**](docs/AuthenticationApi.md#auth_generatetoken_post) | **POST** /1.0.0/auth/generatetoken | Create an authentication token
*AuthenticationApi* | [**auth_validatetoken_get**](docs/AuthenticationApi.md#auth_validatetoken_get) | **GET** /1.0.0/auth/validatetoken | Validate authentication token
*ContractsApi* | [**inventory_links_contract_by_linkid_and_contractid_get**](docs/ContractsApi.md#inventory_links_contract_by_linkid_and_contractid_get) | **GET** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Get active Contract by ContractID
*ContractsApi* | [**inventory_links_contract_by_linkid_and_contractid_put**](docs/ContractsApi.md#inventory_links_contract_by_linkid_and_contractid_put) | **PUT** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Update active Contract by ContractID
*ContractsApi* | [**inventory_links_contract_by_linkid_post**](docs/ContractsApi.md#inventory_links_contract_by_linkid_post) | **POST** /1.0.0/inventory/links/{linkid}/contract | Create new Contract on specified link
*CustomersApi* | [**account_by_customeruuid_get**](docs/CustomersApi.md#account_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid} | Get account information details
*CustomersApi* | [**account_user_by_customeruuid_get**](docs/CustomersApi.md#account_user_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid}/user | List users
*DatacentresApi* | [**inventory_datacenters_get**](docs/DatacentresApi.md#inventory_datacenters_get) | **GET** /1.0.0/inventory/datacenters | Get list of all the data centers
*EndpointsApi* | [**eis100_endpoints_assign_topology_tag_by_endpointuuid_post**](docs/EndpointsApi.md#eis100_endpoints_assign_topology_tag_by_endpointuuid_post) | **POST** /eis/1.0.0/endpoints/{endpointuuid}/assign_topology_tag | Assign a Topology Tag to an Endpoint
*EndpointsApi* | [**inventory_endpoint_by_endpointuuid_get**](docs/EndpointsApi.md#inventory_endpoint_by_endpointuuid_get) | **GET** /1.0.0/inventory/endpoint/{endpointuuid} | Get information about the specified endpoint
*EndpointsApi* | [**inventory_endpoints_customeruuid_by_customeruuid_get**](docs/EndpointsApi.md#inventory_endpoints_customeruuid_by_customeruuid_get) | **GET** /1.0.0/inventory/endpoints/customeruuid/{customeruuid} | Get list of endpoints for a customer
*EndpointsApi* | [**inventory_regularendpoint_post**](docs/EndpointsApi.md#inventory_regularendpoint_post) | **POST** /1.0.0/inventory/regularendpoint | Create Physical (Port) Endpoint
*EndpointsApi* | [**inventory_vnfendpoint_post**](docs/EndpointsApi.md#inventory_vnfendpoint_post) | **POST** /1.0.0/inventory/vnfendpoint | Create VNF Endpoint
*LinksApi* | [**inventory_link_post**](docs/LinksApi.md#inventory_link_post) | **POST** /1.0.0/inventory/link | Create Link and initial Contract
*LinksApi* | [**inventory_links_by_linkid_get**](docs/LinksApi.md#inventory_links_by_linkid_get) | **GET** /1.0.0/inventory/links/{linkid} | Get details of specified link
*LinksApi* | [**inventory_links_customer_by_customeruuid_get**](docs/LinksApi.md#inventory_links_customer_by_customeruuid_get) | **GET** /1.0.0/inventory/links/customer/{customeruuid} | Get active Links
*LinksApi* | [**inventory_links_history_by_linkid_get**](docs/LinksApi.md#inventory_links_history_by_linkid_get) | **GET** /1.0.0/inventory/links/history/{linkid} | Get Link history
*TopologiesApi* | [**ttms100_topology_tag_by_topotaguuid_delete**](docs/TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_delete) | **DELETE** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Delete a topology tag
*TopologiesApi* | [**ttms100_topology_tag_by_topotaguuid_get**](docs/TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_get) | **GET** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Get information about the specified topology tag
*TopologiesApi* | [**ttms100_topology_tag_by_topotaguuid_put**](docs/TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_put) | **PUT** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Update a topology tag&#39;s name and/or description
*TopologiesApi* | [**ttms100_topology_tag_get**](docs/TopologiesApi.md#ttms100_topology_tag_get) | **GET** /ttms/1.0.0/topology_tag | List all topology tags
*TopologiesApi* | [**ttms100_topology_tag_objects_by_topotaguuid_get**](docs/TopologiesApi.md#ttms100_topology_tag_objects_by_topotaguuid_get) | **GET** /ttms/1.0.0/topology_tag/{topotaguuid}/objects/ | List objects for Topology
*TopologiesApi* | [**ttms100_topology_tag_post**](docs/TopologiesApi.md#ttms100_topology_tag_post) | **POST** /ttms/1.0.0/topology_tag | Create a named topology tag
*VnfsApi* | [**marketplace_image_get**](docs/VnfsApi.md#marketplace_image_get) | **GET** /1.0.0/marketplace/image | List images in the Marketplace
*VportsApi* | [**inventory_regularvport_post**](docs/VportsApi.md#inventory_regularvport_post) | **POST** /1.0.0/inventory/regularvport | Create VPort for physical endpoint
*VportsApi* | [**inventory_vnf_vport_post**](docs/VportsApi.md#inventory_vnf_vport_post) | **POST** /1.0.0/inventory/vnf/vport | Create VNF VPort
*VportsApi* | [**inventory_vport_by_vportuuid_get**](docs/VportsApi.md#inventory_vport_by_vportuuid_get) | **GET** /1.0.0/inventory/vport/{vportuuid} | Get information about the specified VPort


# DOCUMENTATION FOR MODELS
 - [TelstraTPN::Object::AccountResponse](docs/AccountResponse.md)
 - [TelstraTPN::Object::AuthGeneratetokenResponse](docs/AuthGeneratetokenResponse.md)
 - [TelstraTPN::Object::AuthValidatetokenResponse](docs/AuthValidatetokenResponse.md)
 - [TelstraTPN::Object::Billing](docs/Billing.md)
 - [TelstraTPN::Object::Classification](docs/Classification.md)
 - [TelstraTPN::Object::Contract](docs/Contract.md)
 - [TelstraTPN::Object::Datacenter](docs/Datacenter.md)
 - [TelstraTPN::Object::Eis100EndpointsAssignTopologyTagRequest](docs/Eis100EndpointsAssignTopologyTagRequest.md)
 - [TelstraTPN::Object::Endpoint](docs/Endpoint.md)
 - [TelstraTPN::Object::EndpointPort](docs/EndpointPort.md)
 - [TelstraTPN::Object::Endpointlist](docs/Endpointlist.md)
 - [TelstraTPN::Object::Error](docs/Error.md)
 - [TelstraTPN::Object::Error74](docs/Error74.md)
 - [TelstraTPN::Object::Flavor](docs/Flavor.md)
 - [TelstraTPN::Object::GlanceImage](docs/GlanceImage.md)
 - [TelstraTPN::Object::InventoryDatacenters401Error](docs/InventoryDatacenters401Error.md)
 - [TelstraTPN::Object::InventoryDatacentersResponse](docs/InventoryDatacentersResponse.md)
 - [TelstraTPN::Object::InventoryEndpointResponse](docs/InventoryEndpointResponse.md)
 - [TelstraTPN::Object::InventoryEndpointsCustomeruuidResponse](docs/InventoryEndpointsCustomeruuidResponse.md)
 - [TelstraTPN::Object::InventoryLinkRequest](docs/InventoryLinkRequest.md)
 - [TelstraTPN::Object::InventoryLinkResponse](docs/InventoryLinkResponse.md)
 - [TelstraTPN::Object::InventoryLinksContractRequest](docs/InventoryLinksContractRequest.md)
 - [TelstraTPN::Object::InventoryLinksContractRequest37](docs/InventoryLinksContractRequest37.md)
 - [TelstraTPN::Object::InventoryLinksContractResponse](docs/InventoryLinksContractResponse.md)
 - [TelstraTPN::Object::InventoryLinksContractResponse33](docs/InventoryLinksContractResponse33.md)
 - [TelstraTPN::Object::InventoryLinksContractResponse38](docs/InventoryLinksContractResponse38.md)
 - [TelstraTPN::Object::InventoryLinksHistoryResponse](docs/InventoryLinksHistoryResponse.md)
 - [TelstraTPN::Object::InventoryLinksResponse](docs/InventoryLinksResponse.md)
 - [TelstraTPN::Object::InventoryRegularendpointRequest](docs/InventoryRegularendpointRequest.md)
 - [TelstraTPN::Object::InventoryRegularendpointResponse](docs/InventoryRegularendpointResponse.md)
 - [TelstraTPN::Object::InventoryRegularvportRequest](docs/InventoryRegularvportRequest.md)
 - [TelstraTPN::Object::InventoryRegularvportResponse](docs/InventoryRegularvportResponse.md)
 - [TelstraTPN::Object::InventoryVnfVportRequest](docs/InventoryVnfVportRequest.md)
 - [TelstraTPN::Object::InventoryVnfVportResponse](docs/InventoryVnfVportResponse.md)
 - [TelstraTPN::Object::InventoryVnfendpointRequest](docs/InventoryVnfendpointRequest.md)
 - [TelstraTPN::Object::InventoryVnfendpointResponse](docs/InventoryVnfendpointResponse.md)
 - [TelstraTPN::Object::Link](docs/Link.md)
 - [TelstraTPN::Object::Link66](docs/Link66.md)
 - [TelstraTPN::Object::MarketplaceImageResponse](docs/MarketplaceImageResponse.md)
 - [TelstraTPN::Object::Meta](docs/Meta.md)
 - [TelstraTPN::Object::Object52](docs/Object52.md)
 - [TelstraTPN::Object::Params](docs/Params.md)
 - [TelstraTPN::Object::Params31](docs/Params31.md)
 - [TelstraTPN::Object::Params34](docs/Params34.md)
 - [TelstraTPN::Object::Params39](docs/Params39.md)
 - [TelstraTPN::Object::Product](docs/Product.md)
 - [TelstraTPN::Object::Role](docs/Role.md)
 - [TelstraTPN::Object::SuccessFragment](docs/SuccessFragment.md)
 - [TelstraTPN::Object::Topology](docs/Topology.md)
 - [TelstraTPN::Object::Ttms100TopologyTagObjectsResponse](docs/Ttms100TopologyTagObjectsResponse.md)
 - [TelstraTPN::Object::Ttms100TopologyTagRequest](docs/Ttms100TopologyTagRequest.md)
 - [TelstraTPN::Object::User](docs/User.md)
 - [TelstraTPN::Object::Vlan](docs/Vlan.md)
 - [TelstraTPN::Object::VnfTag](docs/VnfTag.md)
 - [TelstraTPN::Object::Vport](docs/Vport.md)
 - [TelstraTPN::Object::Vportvalue](docs/Vportvalue.md)


# DOCUMENTATION FOR AUTHORIZATION

## auth

- **Type**: OAuth
- **Flow**: password
- **Authorization URL**: 
- **Scopes**: 
  - **Oauth2**: Oauth2

