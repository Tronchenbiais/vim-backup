from denite.base.source import Base

from denite.util import Nvim, UserContext, Candidates

class Source(Base):

    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)

        self.name = 'tab'
        self.kind = 'tab'
        self.sorters = ['sorter/word']

    def gather_candidates(self, context: UserContext) -> Candidates:
        context['is_interactive'] = True
        candidates = []
        for t in self.vim.tabpages:
            tabNr = t.number
            tabTitle = self.vim.call('GetTabTitle', tabNr)
            candidates.append({
                'word': str(tabNr) + ' : ' + tabTitle,
                'action__tabnr': str(tabNr)
                })
        inp = context['input']
        candidates.append({
            'word' : inp,
            'abbr': '[new]' + inp,
            'action__tabnr': -1
            })
        return candidates

