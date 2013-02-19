for plugin in [expand('<sfile>:p:h:h')] ", expand('<sfile>:p:h:h:h') . '/VimRegStyle']
  let &rtp = plugin . ',' . &rtp . ',' . plugin . '/after'
endfor

"runtime plugin/extended_regex.vim
runtime plugin/nexus.vim
