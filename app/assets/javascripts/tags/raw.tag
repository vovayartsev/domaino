<raw>
  <div name="div"></div>
  <script>
    this.set = () => { this.div.innerHTML = opts.html }
    this.on('update', this.set)
    this.on('mount', this.set)
  </script>
</raw>
