try:
    from __main__ import cli
except ImportError:
    cli = False


def filter_tags(src):
    if cli:
        tags = cli.options.tags
        res = {}
        if isinstance(src, list):
            return _filter_list(src, tags)
        if isinstance(src, dict):
            return _filter_dict(src, tags)
    else:
        return src

def _filter_list(item_list, tags):
    items = []
    for item in item_list:
        if isinstance(item, dict):
            if item.get('tag') in tags:
                items.append(item)
    return items

def _filter_dict(item_dict, tags):
    items = {}
    for key, item in item_dict.items():
        if isinstance(item, dict):
            if item.get('tag') in tags:
                items[key] = item
    return items


class FilterModule(object):

    def filters(self):
        return { 'filter_tags': filter_tags }
