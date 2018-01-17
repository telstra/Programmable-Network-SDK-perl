# TelstraTPN::ContractsApi

## Load the API package
```perl
use TelstraTPN::Object::ContractsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inventory_links_contract_by_linkid_and_contractid_get**](ContractsApi.md#inventory_links_contract_by_linkid_and_contractid_get) | **GET** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Get active Contract by ContractID
[**inventory_links_contract_by_linkid_and_contractid_put**](ContractsApi.md#inventory_links_contract_by_linkid_and_contractid_put) | **PUT** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Update active Contract by ContractID
[**inventory_links_contract_by_linkid_post**](ContractsApi.md#inventory_links_contract_by_linkid_post) | **POST** /1.0.0/inventory/links/{linkid}/contract | Create new Contract on specified link


# **inventory_links_contract_by_linkid_and_contractid_get**
> InventoryLinksContractResponse inventory_links_contract_by_linkid_and_contractid_get(linkid => $linkid, contractid => $contractid)

Get active Contract by ContractID

Get active Contract by ContractID

### Example 
```perl
use Data::Dumper;
use TelstraTPN::ContractsApi;
my $api_instance = TelstraTPN::ContractsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link
my $contractid = 'contractid_example'; # string | Unique identifier representing a specific contract

eval { 
    my $result = $api_instance->inventory_links_contract_by_linkid_and_contractid_get(linkid => $linkid, contractid => $contractid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContractsApi->inventory_links_contract_by_linkid_and_contractid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 
 **contractid** | **string**| Unique identifier representing a specific contract | 

### Return type

[**InventoryLinksContractResponse**](InventoryLinksContractResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_links_contract_by_linkid_and_contractid_put**
> InventoryLinksContractResponse33 inventory_links_contract_by_linkid_and_contractid_put(linkid => $linkid, contractid => $contractid, body => $body)

Update active Contract by ContractID

Update active Contract by ContractID

### Example 
```perl
use Data::Dumper;
use TelstraTPN::ContractsApi;
my $api_instance = TelstraTPN::ContractsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link
my $contractid = 'contractid_example'; # string | Unique identifier representing a specific contract
my $body = TelstraTPN::Object::InventoryLinksContractRequest->new(); # InventoryLinksContractRequest | 

eval { 
    my $result = $api_instance->inventory_links_contract_by_linkid_and_contractid_put(linkid => $linkid, contractid => $contractid, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContractsApi->inventory_links_contract_by_linkid_and_contractid_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 
 **contractid** | **string**| Unique identifier representing a specific contract | 
 **body** | [**InventoryLinksContractRequest**](InventoryLinksContractRequest.md)|  | [optional] 

### Return type

[**InventoryLinksContractResponse33**](InventoryLinksContractResponse33.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_links_contract_by_linkid_post**
> ARRAY[InventoryLinksContractResponse38] inventory_links_contract_by_linkid_post(linkid => $linkid, body => $body)

Create new Contract on specified link

Create new Contract on specified link

### Example 
```perl
use Data::Dumper;
use TelstraTPN::ContractsApi;
my $api_instance = TelstraTPN::ContractsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link
my $body = TelstraTPN::Object::InventoryLinksContractRequest37->new(); # InventoryLinksContractRequest37 | 

eval { 
    my $result = $api_instance->inventory_links_contract_by_linkid_post(linkid => $linkid, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContractsApi->inventory_links_contract_by_linkid_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 
 **body** | [**InventoryLinksContractRequest37**](InventoryLinksContractRequest37.md)|  | [optional] 

### Return type

[**ARRAY[InventoryLinksContractResponse38]**](InventoryLinksContractResponse38.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

