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
package TelstraTPN::Object::Contract;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

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
__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
}

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } else {
        	$log->debugf("Warning: %s (%s) does not exist in input hash\n", $_key, $_json_attribute);
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
    $log->debugf("deserializing %s with %s",Dumper($data), $type);
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "TelstraTPN::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => '',
                                  class => 'Contract',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'contractid' => {
    	datatype => 'string',
    	base_name => 'contractid',
    	description => 'Identifier of a contract',
    	format => '',
    	read_only => '',
    		},
    'duration' => {
    	datatype => 'int',
    	base_name => 'duration',
    	description => 'Duration of contract in minutes',
    	format => '',
    	read_only => '',
    		},
    'bandwidth' => {
    	datatype => 'int',
    	base_name => 'bandwidth',
    	description => 'Bandwidth in kB/s',
    	format => '',
    	read_only => '',
    		},
    'price' => {
    	datatype => 'int',
    	base_name => 'price',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'contract_status' => {
    	datatype => 'int',
    	base_name => 'contractStatus',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'version' => {
    	datatype => 'int',
    	base_name => 'version',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'deletedtimestamp' => {
    	datatype => 'int',
    	base_name => 'deletedtimestamp',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'currency_code' => {
    	datatype => 'string',
    	base_name => 'currencyCode',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'currency_id' => {
    	datatype => 'string',
    	base_name => 'currencyID',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'renewal_option' => {
    	datatype => 'int',
    	base_name => 'renewal-option',
    	description => 'Renewal Option: 0&#x3D;Auto Disconnect, 1&#x3D;Auto Renew, 2&#x3D;Pay per hour',
    	format => '',
    	read_only => '',
    		},
    'contract_start_time' => {
    	datatype => 'int',
    	base_name => 'contract-start-time',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'contract_end_time' => {
    	datatype => 'int',
    	base_name => 'contract-end-time',
    	description => '',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'contractid' => 'string',
    'duration' => 'int',
    'bandwidth' => 'int',
    'price' => 'int',
    'contract_status' => 'int',
    'version' => 'int',
    'deletedtimestamp' => 'int',
    'currency_code' => 'string',
    'currency_id' => 'string',
    'renewal_option' => 'int',
    'contract_start_time' => 'int',
    'contract_end_time' => 'int'
} );

__PACKAGE__->attribute_map( {
    'contractid' => 'contractid',
    'duration' => 'duration',
    'bandwidth' => 'bandwidth',
    'price' => 'price',
    'contract_status' => 'contractStatus',
    'version' => 'version',
    'deletedtimestamp' => 'deletedtimestamp',
    'currency_code' => 'currencyCode',
    'currency_id' => 'currencyID',
    'renewal_option' => 'renewal-option',
    'contract_start_time' => 'contract-start-time',
    'contract_end_time' => 'contract-end-time'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
