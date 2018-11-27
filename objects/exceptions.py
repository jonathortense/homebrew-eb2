# Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

import sys


class EBCLIException(Exception):
    """ Base exception for all EB-CLI exceptions """

    ''' Python 3 removes the .message property
        This causes some weird unicode issues.
        A message for a python 2 exception could be in unicode.
        Using str(e) and comparing results is problematic with unicode in
        python 2. However using the .message works just fine. So we add the
        .message back into 3 to solve compatibility problems'''
    if sys.version_info[0] >= 3:
        @property
        def message(self):
            return str(self)

class CommandError(EBCLIException):
    """ Error occurred executing some non eb cli command """
    def __init__(self, message=None, output=None, code=None):
        super(CommandError, self).__init__(message)
        self.output = output
        self.code = code
