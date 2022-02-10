require 'rake'

# New SDK

desc 'Create new SDK'
task :create_domain_sdk do
    ARGV.each { |name| task name.to_sym do ; end }

    name = ARGV[1]
    sh "cd Scripts && ./create-sdk #{name}"
end

desc 'Create new SDK Microfeature'
task :create_microfrontend_sdk do 
    
    STDOUT.puts "1. Deseja criar um SDK de micro frontend? (Y/n)"
    inputMicroFrontend = STDIN.gets.strip

    STDOUT.puts "2. Digite o nome do seu Dominio"
    inputDomain = STDIN.gets.strip

    if inputMicroFrontend == "Y"
        
        STDOUT.puts "3. Digite seus micro frontends, separado por virgula (ex: Feature1,Feature2)"
        inputMicroFrontendNames = STDIN.gets.strip
        sh "cd MicrofrontendSDK && make install && featureGen #{inputDomain} #{inputMicroFrontendNames}"

    elsif inputMicroFrontend == "n"
        sh "cd MicrofrontendSDK && make install && featureGen #{inputDomain}"
    else
        sh "echo Command not found"
    end
 
end