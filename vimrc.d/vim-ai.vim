"let s:vim_ai_endpoint_url = "http://localhost:11434/v1/chat/completions"
"let s:vim_ai_model = "llama3.1"
"let s:enable_auth = 0

let s:vim_ai_endpoint_url = "https://api.deepseek.com/v1/chat/completions"
let s:vim_ai_model = "deepseek-coder"
let s:enable_auth = 1

let s:vim_ai_temperature = 0.3
let s:vim_ai_chat_prompt =<< trim END
>>> system

You are a helpful code assistant.

Assume that all unknown symbols are properly initialized elsewhere.

Add a syntax type after ``` to enable proper syntax highlighting in fenced code blocks.
END

let s:vim_ai_edit_prompt =<< trim END
>>> system

You will act as a code generator.

Do not write any introduction, conclusion, or explanation.

Do not use fenced code blocks.
END

let s:vim_ai_chat_config = #{
\  engine: "chat",
\  options: #{
\    model: s:vim_ai_model,
\    initial_prompt: s:vim_ai_chat_prompt,
\    temperature: s:vim_ai_temperature,
\    endpoint_url: s:vim_ai_endpoint_url,
\    enable_auth: s:enable_auth,
\    max_tokens: 0,
\    request_timeout: 60,
\  },
\  ui: #{
\    code_syntax_enabled: 1,
\  },
\}

let s:vim_ai_edit_config = #{
\  engine: "chat",
\  options: #{
\    model: s:vim_ai_model,
\    initial_prompt: s:vim_ai_edit_prompt,
\    temperature: s:vim_ai_temperature,
\    endpoint_url: s:vim_ai_endpoint_url,
\    enable_auth: s:enable_auth,
\    max_tokens: 0,
\    request_timeout: 60,
\  },
\}
"\  ui: #{
"\    paste_mode: 1,
"\  },

let g:vim_ai_chat = s:vim_ai_chat_config
let g:vim_ai_complete = s:vim_ai_edit_config
let g:vim_ai_edit = s:vim_ai_edit_config

let g:vim_ai_roles_config_file = expand('~/.vim/vimrc.d/vim-ai.ini')

" custom command suggesting git commit message, takes no arguments
function! GitCommitMessageFn()
  let l:diff = system('git --no-pager diff --staged')
  let l:prompt = "generate a short commit message from the diff below, iff not diff is provided, raise an error:\n" . l:diff
  let l:config = {
  \  "engine": "chat",
  \  "options": {
  \    "initial_prompt": ">>> system\nyou are a code assistant",
  \    "temperature": 1,
  \  },
  \}
  call vim_ai#AIRun(l:config, l:prompt)
endfunction
command! GitCommitMessage call GitCommitMessageFn()

" custom command that provides a code review for selected code block
function! CodeReviewFn(range) range
  let l:prompt = "programming syntax is " . &filetype . ", review the code below"
  let l:config = {
  \  "options": {
  \    "initial_prompt": ">>> system\nyou are a clean code expert",
  \  },
  \}
  exe a:firstline.",".a:lastline . "call vim_ai#AIChatRun(a:range, l:config, l:prompt)"
endfunction
command! -range=0 CodeReview <line1>,<line2>call CodeReviewFn(<count>)

" custom command adding filetype to the instruction
function! AISyntaxFn(...) range
  let l:instruction = "programming language is " . &filetype
  if a:0
    let l:instruction = l:instruction . " - " . a:1
  endif
  exe a:firstline . ',' . a:lastline . 'call vim_ai#AIRun({}, l:instruction)'
endfunction
command! -range -nargs=? AISyntax <line1>,<line2>call AISyntaxFn(<f-args>)


xnoremap <leader>c :AIChat<CR>
nnoremap <leader>c :AIChat<CR>
let g:vim_ai_token_file_path = '~/.vim/token'
