class StringExtra:
    def convert_to_camel_case(self, string):
        output = ''.join(x for x in string.title() if x.isalnum())
        return output[0].lower() + output[1:]

    def create_string_from_list(self, l, separator=' '):
        output = separator.join(x for x in l)
        return output
