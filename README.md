# Programmable Network perl SDK

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

The tokens will be placed in the `TelstraTPN::Configuration` namespace
as follows, but you don't need to know about this.

- `$TelstraTPN::Configuration::username`

    String. The username for basic auth.

- `$TelstraTPN::Configuration::password`

    String. The password for basic auth.

- `$TelstraTPN::Configuration::api_key`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $TelstraTPN::Configuration::api_key = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$TelstraTPN::Configuration::api_key_prefix`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $TelstraTPN::Configuration::api_key_prefix = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$TelstraTPN::Configuration::access_token`

    String. The OAuth access token.

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method
returns (and optionally sets, but only if the API client has not been
created yet) the current value of `base_url`.

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
use TelstraTPN::Object::Link;
use TelstraTPN::Object::Link66;
use TelstraTPN::Object::Meta;
use TelstraTPN::Object::Model100AccountResponse;
use TelstraTPN::Object::Model100AuthGeneratetokenResponse;
use TelstraTPN::Object::Model100AuthValidatetokenResponse;
use TelstraTPN::Object::Model100InventoryDatacenters401Error;
use TelstraTPN::Object::Model100InventoryDatacentersResponse;
use TelstraTPN::Object::Model100InventoryEndpointResponse;
use TelstraTPN::Object::Model100InventoryEndpointsCustomeruuidResponse;
use TelstraTPN::Object::Model100InventoryLinkRequest;
use TelstraTPN::Object::Model100InventoryLinkResponse;
use TelstraTPN::Object::Model100InventoryLinksContractRequest;
use TelstraTPN::Object::Model100InventoryLinksContractRequest37;
use TelstraTPN::Object::Model100InventoryLinksContractResponse;
use TelstraTPN::Object::Model100InventoryLinksContractResponse33;
use TelstraTPN::Object::Model100InventoryLinksContractResponse38;
use TelstraTPN::Object::Model100InventoryLinksHistoryResponse;
use TelstraTPN::Object::Model100InventoryLinksResponse;
use TelstraTPN::Object::Model100InventoryRegularendpointRequest;
use TelstraTPN::Object::Model100InventoryRegularendpointResponse;
use TelstraTPN::Object::Model100InventoryRegularvportRequest;
use TelstraTPN::Object::Model100InventoryRegularvportResponse;
use TelstraTPN::Object::Model100InventoryVnfVportRequest;
use TelstraTPN::Object::Model100InventoryVnfVportResponse;
use TelstraTPN::Object::Model100InventoryVnfendpointRequest;
use TelstraTPN::Object::Model100InventoryVnfendpointResponse;
use TelstraTPN::Object::Model100MarketplaceImageResponse;
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
use TelstraTPN::Object::Link;
use TelstraTPN::Object::Link66;
use TelstraTPN::Object::Meta;
use TelstraTPN::Object::Model100AccountResponse;
use TelstraTPN::Object::Model100AuthGeneratetokenResponse;
use TelstraTPN::Object::Model100AuthValidatetokenResponse;
use TelstraTPN::Object::Model100InventoryDatacenters401Error;
use TelstraTPN::Object::Model100InventoryDatacentersResponse;
use TelstraTPN::Object::Model100InventoryEndpointResponse;
use TelstraTPN::Object::Model100InventoryEndpointsCustomeruuidResponse;
use TelstraTPN::Object::Model100InventoryLinkRequest;
use TelstraTPN::Object::Model100InventoryLinkResponse;
use TelstraTPN::Object::Model100InventoryLinksContractRequest;
use TelstraTPN::Object::Model100InventoryLinksContractRequest37;
use TelstraTPN::Object::Model100InventoryLinksContractResponse;
use TelstraTPN::Object::Model100InventoryLinksContractResponse33;
use TelstraTPN::Object::Model100InventoryLinksContractResponse38;
use TelstraTPN::Object::Model100InventoryLinksHistoryResponse;
use TelstraTPN::Object::Model100InventoryLinksResponse;
use TelstraTPN::Object::Model100InventoryRegularendpointRequest;
use TelstraTPN::Object::Model100InventoryRegularendpointResponse;
use TelstraTPN::Object::Model100InventoryRegularvportRequest;
use TelstraTPN::Object::Model100InventoryRegularvportResponse;
use TelstraTPN::Object::Model100InventoryVnfVportRequest;
use TelstraTPN::Object::Model100InventoryVnfVportResponse;
use TelstraTPN::Object::Model100InventoryVnfendpointRequest;
use TelstraTPN::Object::Model100InventoryVnfendpointResponse;
use TelstraTPN::Object::Model100MarketplaceImageResponse;
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
use TelstraTPN::Configuration;
use TelstraTPN::;

my $api_instance = TelstraTPN::AuthenticationApi->new();
my $grant_type = 'grant_type_example'; # string | 
my $username = 'username_example'; # string | 
my $password = 'password_example'; # string | 

eval {
    my $result = $api_instance->100_auth_generatetoken_post(grant_type => $grant_type, username => $username, password => $password);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AuthenticationApi->100_auth_generatetoken_post: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://penapi.pacnetconnect.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthenticationApi* | [**100_auth_generatetoken_post**](docs/AuthenticationApi.md#100_auth_generatetoken_post) | **POST** /1.0.0/auth/generatetoken | Create an authentication token
*AuthenticationApi* | [**100_auth_validatetoken_get**](docs/AuthenticationApi.md#100_auth_validatetoken_get) | **GET** /1.0.0/auth/validatetoken | Validate authentication token
*ContractsApi* | [**100_inventory_links_contract_by_linkid_and_contractid_get**](docs/ContractsApi.md#100_inventory_links_contract_by_linkid_and_contractid_get) | **GET** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Get active Contract by ContractID
*ContractsApi* | [**100_inventory_links_contract_by_linkid_and_contractid_put**](docs/ContractsApi.md#100_inventory_links_contract_by_linkid_and_contractid_put) | **PUT** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Update active Contract by ContractID
*ContractsApi* | [**100_inventory_links_contract_by_linkid_post**](docs/ContractsApi.md#100_inventory_links_contract_by_linkid_post) | **POST** /1.0.0/inventory/links/{linkid}/contract | Create new Contract on specified link
*CustomersApi* | [**100_account_by_customeruuid_get**](docs/CustomersApi.md#100_account_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid} | Get account information details
*CustomersApi* | [**100_account_user_by_customeruuid_get**](docs/CustomersApi.md#100_account_user_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid}/user | List users
*DatacentresApi* | [**100_inventory_datacenters_get**](docs/DatacentresApi.md#100_inventory_datacenters_get) | **GET** /1.0.0/inventory/datacenters | Get list of all the data centers
*EndpointsApi* | [**100_inventory_endpoint_by_endpointuuid_get**](docs/EndpointsApi.md#100_inventory_endpoint_by_endpointuuid_get) | **GET** /1.0.0/inventory/endpoint/{endpointuuid} | Get information about the specified endpoint
*EndpointsApi* | [**100_inventory_endpoints_customeruuid_by_customeruuid_get**](docs/EndpointsApi.md#100_inventory_endpoints_customeruuid_by_customeruuid_get) | **GET** /1.0.0/inventory/endpoints/customeruuid/{customeruuid} | Get list of endpoints for a customer
*EndpointsApi* | [**100_inventory_regularendpoint_post**](docs/EndpointsApi.md#100_inventory_regularendpoint_post) | **POST** /1.0.0/inventory/regularendpoint | Create Physical (Port) Endpoint
*EndpointsApi* | [**100_inventory_vnfendpoint_post**](docs/EndpointsApi.md#100_inventory_vnfendpoint_post) | **POST** /1.0.0/inventory/vnfendpoint | Create VNF Endpoint
*EndpointsApi* | [**eis100_endpoints_assign_topology_tag_by_endpointuuid_post**](docs/EndpointsApi.md#eis100_endpoints_assign_topology_tag_by_endpointuuid_post) | **POST** /eis/1.0.0/endpoints/{endpointuuid}/assign_topology_tag | Assign a Topology Tag to an Endpoint
*LinksApi* | [**100_inventory_link_post**](docs/LinksApi.md#100_inventory_link_post) | **POST** /1.0.0/inventory/link | Create Link and initial Contract
*LinksApi* | [**100_inventory_links_by_linkid_get**](docs/LinksApi.md#100_inventory_links_by_linkid_get) | **GET** /1.0.0/inventory/links/{linkid} | Get details of specified link
*LinksApi* | [**100_inventory_links_customer_by_customeruuid_get**](docs/LinksApi.md#100_inventory_links_customer_by_customeruuid_get) | **GET** /1.0.0/inventory/links/customer/{customeruuid} | Get active Links
*LinksApi* | [**100_inventory_links_history_by_linkid_get**](docs/LinksApi.md#100_inventory_links_history_by_linkid_get) | **GET** /1.0.0/inventory/links/history/{linkid} | Get Link history
*TopologiesApi* | [**ttms100_topology_tag_by_topotaguuid_delete**](docs/TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_delete) | **DELETE** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Delete a topology tag
*TopologiesApi* | [**ttms100_topology_tag_by_topotaguuid_get**](docs/TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_get) | **GET** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Get information about the specified topology tag
*TopologiesApi* | [**ttms100_topology_tag_by_topotaguuid_put**](docs/TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_put) | **PUT** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Update a topology tag&#39;s name and/or description
*TopologiesApi* | [**ttms100_topology_tag_get**](docs/TopologiesApi.md#ttms100_topology_tag_get) | **GET** /ttms/1.0.0/topology_tag | List all topology tags
*TopologiesApi* | [**ttms100_topology_tag_objects_by_topotaguuid_get**](docs/TopologiesApi.md#ttms100_topology_tag_objects_by_topotaguuid_get) | **GET** /ttms/1.0.0/topology_tag/{topotaguuid}/objects/ | List objects for Topology
*TopologiesApi* | [**ttms100_topology_tag_post**](docs/TopologiesApi.md#ttms100_topology_tag_post) | **POST** /ttms/1.0.0/topology_tag | Create a named topology tag
*VnfsApi* | [**100_marketplace_image_get**](docs/VnfsApi.md#100_marketplace_image_get) | **GET** /1.0.0/marketplace/image | List images in the Marketplace
*VportsApi* | [**100_inventory_regularvport_post**](docs/VportsApi.md#100_inventory_regularvport_post) | **POST** /1.0.0/inventory/regularvport | Create VPort for physical endpoint
*VportsApi* | [**100_inventory_vnf_vport_post**](docs/VportsApi.md#100_inventory_vnf_vport_post) | **POST** /1.0.0/inventory/vnf/vport | Create VNF VPort
*VportsApi* | [**100_inventory_vport_by_vportuuid_get**](docs/VportsApi.md#100_inventory_vport_by_vportuuid_get) | **GET** /1.0.0/inventory/vport/{vportuuid} | Get information about the specified VPort


# DOCUMENTATION FOR MODELS
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
 - [TelstraTPN::Object::Link](docs/Link.md)
 - [TelstraTPN::Object::Link66](docs/Link66.md)
 - [TelstraTPN::Object::Meta](docs/Meta.md)
 - [TelstraTPN::Object::Model100AccountResponse](docs/Model100AccountResponse.md)
 - [TelstraTPN::Object::Model100AuthGeneratetokenResponse](docs/Model100AuthGeneratetokenResponse.md)
 - [TelstraTPN::Object::Model100AuthValidatetokenResponse](docs/Model100AuthValidatetokenResponse.md)
 - [TelstraTPN::Object::Model100InventoryDatacenters401Error](docs/Model100InventoryDatacenters401Error.md)
 - [TelstraTPN::Object::Model100InventoryDatacentersResponse](docs/Model100InventoryDatacentersResponse.md)
 - [TelstraTPN::Object::Model100InventoryEndpointResponse](docs/Model100InventoryEndpointResponse.md)
 - [TelstraTPN::Object::Model100InventoryEndpointsCustomeruuidResponse](docs/Model100InventoryEndpointsCustomeruuidResponse.md)
 - [TelstraTPN::Object::Model100InventoryLinkRequest](docs/Model100InventoryLinkRequest.md)
 - [TelstraTPN::Object::Model100InventoryLinkResponse](docs/Model100InventoryLinkResponse.md)
 - [TelstraTPN::Object::Model100InventoryLinksContractRequest](docs/Model100InventoryLinksContractRequest.md)
 - [TelstraTPN::Object::Model100InventoryLinksContractRequest37](docs/Model100InventoryLinksContractRequest37.md)
 - [TelstraTPN::Object::Model100InventoryLinksContractResponse](docs/Model100InventoryLinksContractResponse.md)
 - [TelstraTPN::Object::Model100InventoryLinksContractResponse33](docs/Model100InventoryLinksContractResponse33.md)
 - [TelstraTPN::Object::Model100InventoryLinksContractResponse38](docs/Model100InventoryLinksContractResponse38.md)
 - [TelstraTPN::Object::Model100InventoryLinksHistoryResponse](docs/Model100InventoryLinksHistoryResponse.md)
 - [TelstraTPN::Object::Model100InventoryLinksResponse](docs/Model100InventoryLinksResponse.md)
 - [TelstraTPN::Object::Model100InventoryRegularendpointRequest](docs/Model100InventoryRegularendpointRequest.md)
 - [TelstraTPN::Object::Model100InventoryRegularendpointResponse](docs/Model100InventoryRegularendpointResponse.md)
 - [TelstraTPN::Object::Model100InventoryRegularvportRequest](docs/Model100InventoryRegularvportRequest.md)
 - [TelstraTPN::Object::Model100InventoryRegularvportResponse](docs/Model100InventoryRegularvportResponse.md)
 - [TelstraTPN::Object::Model100InventoryVnfVportRequest](docs/Model100InventoryVnfVportRequest.md)
 - [TelstraTPN::Object::Model100InventoryVnfVportResponse](docs/Model100InventoryVnfVportResponse.md)
 - [TelstraTPN::Object::Model100InventoryVnfendpointRequest](docs/Model100InventoryVnfendpointRequest.md)
 - [TelstraTPN::Object::Model100InventoryVnfendpointResponse](docs/Model100InventoryVnfendpointResponse.md)
 - [TelstraTPN::Object::Model100MarketplaceImageResponse](docs/Model100MarketplaceImageResponse.md)
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
