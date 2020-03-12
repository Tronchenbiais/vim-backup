let g:vim_projects_dir = g:vim_config_dir . '/projects'

function LoadProject(proj_name, new_tab) abort
    let target_dir = g:vim_projects_dir . '/' . a:proj_name
    if isdirectory(target_dir)
        if(a:new_tab)
            $tabnew
        endif
        exe 'T ' . a:proj_name
        let g:project_name=a:proj_name
        let g:project_config_dir=target_dir
        exe 'source ' . target_dir . '/project_init.vim'
    else
        echoerr 'Project does not exist'
    endif
endfun

function EditProjectConfig(proj_name, new_tab)
    let target_name = a:proj_name
    if a:proj_name == ''
        if exists('g:project_name')
            let target_name = g:project_name
        else
            echoerr 'No project specified'
        endif
    endif
    let target_dir = g:vim_projects_dir . '/' . target_name
    if isdirectory(target_dir)
        if a:new_tab
            tabnew
            exe 'T ' . target_name . ' config'
        endif
        exe 'edit ' . target_dir . '/project_init.vim'
    else
        echoerr 'Project does not exist'
    endif
endfun

function ProjectList() abort
    let project_paths = glob(g:vim_projects_dir . '/*', 0, 1)
    let projects = []
    for path in project_paths
        if isdirectory(path)
            let projects += [fnamemodify(path, ':t')]
        endif
    endfor
    return projects
endfun

function ProjectComplete(ArgLead, CmdLine, CursorPos) abort
    return join(ProjectList(), "\n")
endfun

" Command handles and commands

function ProjectCmdHandle(bang, proj) abort
    if a:bang == '!'
        call LoadProject(a:proj, 1)
    else
        call LoadProject(a:proj, 0)
    endif
endfun
    
function ProjectConfigCmdHandle(bang, proj) abort
    if a:bang == '!'
        call EditProjectConfig(a:proj, 1)
    else
        call EditProjectConfig(a:proj, 0)
    endif
endfun

command -bang -nargs=1 -complete=custom,ProjectComplete 
            \Project call ProjectCmdHandle(<q-bang>, <q-args>)
command -bang -nargs=? -complete=custom,ProjectComplete 
            \ProjectConfig call ProjectConfigCmdHandle(<q-bang>, <q-args>)
