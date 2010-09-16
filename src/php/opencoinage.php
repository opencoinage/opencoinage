<?php
/**
 * OpenCoinage.org XML-RPC API client for PHP 5.3+.
 *
 * This is free and unencumbered software released into the public domain.
 * For more information, please refer to <http://unlicense.org/>
 */

class TokenException extends InvalidArgumentException {}
class InvalidTokenException extends TokenException {}

/**
 * Returns the OpenCoinage API version of the given endpoint.
 */
function opencoinage_version($endpoint) {
  return opencoinage_xmlrpc_call($endpoint, 'version');
}

/**
 * Verifies that the given token is valid at the present time.
 */
function opencoinage_verify($endpoint, $token) {
  return opencoinage_xmlrpc_call($endpoint, 'verify', $token);
}

/**
 * Issues a new token equivalent to the given token, which is revoked.
 */
function opencoinage_reissue($endpoint, $token) {
  return opencoinage_xmlrpc_call($endpoint, 'reissue', $token);
}

/**
 * Invokes a given method at the given XML-RPC endpoint.
 */
function opencoinage_xmlrpc_call($endpoint, $method) {
  try {
    if (!($endpoint instanceof XML_RPC2_Client)) {
      $endpoint = opencoinage_xmlrpc_connect($endpoint);
    }
    $args = array_slice(func_get_args(), 2);
    return call_user_func_array(array($endpoint, $method), $args);
  }
  catch (XML_RPC2_FaultException $error) {
    switch ($error->getFaultCode()) {
      case -32500:
        throw new TokenException($error->getFaultString());
      default:
        throw $error;
    }
  }
}

/**
 * Establishes an HTTP connection to the given XML-RPC endpoint.
 */
function opencoinage_xmlrpc_connect($endpoint, array $options = array()) {
  $options += array(
    'prefix'   => 'opencoinage.',
    'encoding' => 'utf-8'
  );
  if (!class_exists('XML_RPC2_Client')) {
    // @see http://pear.php.net/package/XML_RPC2
    require_once 'XML/RPC2/Client.php';
  }
  return XML_RPC2_Client::create($endpoint, $options);
}
