# TelstraTPN::ContractsApi

## Load the API package
```perl
use TelstraTPN::Object::ContractsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**100_inventory_links_contract_by_linkid_and_contractid_get**](ContractsApi.md#100_inventory_links_contract_by_linkid_and_contractid_get) | **GET** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Get active Contract by ContractID
[**100_inventory_links_contract_by_linkid_and_contractid_put**](ContractsApi.md#100_inventory_links_contract_by_linkid_and_contractid_put) | **PUT** /1.0.0/inventory/links/{linkid}/contract/{contractid} | Update active Contract by ContractID
[**100_inventory_links_contract_by_linkid_post**](ContractsApi.md#100_inventory_links_contract_by_linkid_post) | **POST** /1.0.0/inventory/links/{linkid}/contract | Create new Contract on specified link


# **100_inventory_links_contract_by_linkid_and_contractid_get**
> Model100InventoryLinksContractResponse 100_inventory_links_contract_by_linkid_and_contractid_get(linkid => $linkid, contractid => $contractid)

Get active Contract by ContractID

Get active Contract by ContractID

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::ContractsApi;

my $api_instance = TelstraTPN::ContractsApi->new();
my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link
my $contractid = 'contractid_example'; # string | Unique identifier representing a specific contract

eval { 
    my $result = $api_instance->100_inventory_links_contract_by_linkid_and_contractid_get(linkid => $linkid, contractid => $contractid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContractsApi->100_inventory_links_contract_by_linkid_and_contractid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 
 **contractid** | **string**| Unique identifier representing a specific contract | 

### Return type

[**Model100InventoryLinksContractResponse**](Model100InventoryLinksContractResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_links_contract_by_linkid_and_contractid_put**
> Model100InventoryLinksContractResponse33 100_inventory_links_contract_by_linkid_and_contractid_put(linkid => $linkid, contractid => $contractid, body => $body)

Update active Contract by ContractID

Update active Contract by ContractID

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::ContractsApi;

my $api_instance = TelstraTPN::ContractsApi->new();
my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link
my $contractid = 'contractid_example'; # string | Unique identifier representing a specific contract
my $body = TelstraTPN::Object::Model100InventoryLinksContractRequest->new(); # Model100InventoryLinksContractRequest | 

eval { 
    my $result = $api_instance->100_inventory_links_contract_by_linkid_and_contractid_put(linkid => $linkid, contractid => $contractid, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContractsApi->100_inventory_links_contract_by_linkid_and_contractid_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 
 **contractid** | **string**| Unique identifier representing a specific contract | 
 **body** | [**Model100InventoryLinksContractRequest**](Model100InventoryLinksContractRequest.md)|  | [optional] 

### Return type

[**Model100InventoryLinksContractResponse33**](Model100InventoryLinksContractResponse33.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_links_contract_by_linkid_post**
> Model100InventoryLinksContractResponse38 100_inventory_links_contract_by_linkid_post(linkid => $linkid, body => $body)

Create new Contract on specified link

Create new Contract on specified link

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::ContractsApi;

my $api_instance = TelstraTPN::ContractsApi->new();
my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link
my $body = TelstraTPN::Object::Model100InventoryLinksContractRequest37->new(); # Model100InventoryLinksContractRequest37 | 

eval { 
    my $result = $api_instance->100_inventory_links_contract_by_linkid_post(linkid => $linkid, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContractsApi->100_inventory_links_contract_by_linkid_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 
 **body** | [**Model100InventoryLinksContractRequest37**](Model100InventoryLinksContractRequest37.md)|  | [optional] 

### Return type

[**Model100InventoryLinksContractResponse38**](Model100InventoryLinksContractResponse38.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

