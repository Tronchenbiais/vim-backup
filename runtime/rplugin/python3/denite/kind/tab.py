from denite.base.kind import Base
from denite.util import Nvim, UserContext

class Kind(Base):

    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)
        self.name="tab"
        self.default_action="open"
        self.persist_actions=['delete']
        self.redraw_actions=['delete', 'new']

    def action_open(self, context: UserContext) -> None:
        for target in context['targets']:
            tabnr = target["action__tabnr"]
            if(tabnr == -1):
                tabname = target["word"]
                if(tabname == ""):
                    self.vim.command(f'tabnew')
                else:
                    self.vim.command(f'tabnew | T {tabname}')

            else:
                self.vim.command(f'{tabnr}tabn')

    def action_delete(self, context: UserContext) -> None:
        for target in context['targets']:
            tabnr = target["action__tabnr"]
            if(tabnr >= 0):
                self.vim.command(f'{tabnr}tabc')

